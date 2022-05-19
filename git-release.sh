#!/bin/sh

token=$1
versionfile=$(<version.json)
version=$(sed 's/.*"version": "\(.*\)".*/\1/;t;d' version.json)

branch=$(git rev-parse --abbrev-ref HEAD)
repo_full_name=$(git config --get remote.origin.url | sed 's/.*:\/\/github.com\///;s/.git$//')
#last_tag=$(git describe --abbrev=0 --tags)

generate_post_data_release()
{
  cat <<EOF
{
  "tag_name": "$version",
  "target_commitish": "$branch",
  "name": "$version",
  "body": "value",
  "draft": false,
  "prerelease": false,
  "generate_release_notes": true
}
EOF
}


AUTH="Authorization: token $token"
GH_API="https://api.github.com/repos/maxl-13/Workflow_Bachelorarbeit/releases"
GH_REPO="$GH_API/repos/$repo_full_name"
GH_TAGS="$GH_REPO/releases/latest"

echo "$AUTH"

curl -o /dev/null -sH "$AUTH" $GH_REPO || { echo "Error: Invalid repo, token or network issue!";  exit 1; }

response=$(curl -X POST -H "$AUTH" -H "Accept: application/vnd.github.v3+json" --data "$(generate_post_data)" "https://api.github.com/repos/$repo_full_name/releases")

eval $(echo "$response" | grep -m 1 "id.:" | grep -w id | tr : = | tr -cd '[[:alnum:]]=')
[ "$id" ] || { echo "Error: Failed to get release id for tag: $tag"; echo "$response" | awk 'length($0)<100' >&2; exit 1; }

FILES="$@"
for file in $FILES
do
  if test -f "$file"; then
    curl -H "$AUTH" -H "Accept: application/vnd.github.v3+json" -H "Content-Type: application/octet-stream" --data-binary @"$file" "https://uploads.github.com/repos/MPS/NETStandard-lib/releases/$id/assets?name=$(basename $file)"
  fi
done