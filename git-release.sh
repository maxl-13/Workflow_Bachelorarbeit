#!/bin/bash

version=$1
text=$2
branch=$(git rev-parse --abbrev-ref HEAD)
repo_full_name=$(git config --get remote.origin.url | sed 's/.*:\/\/github.com\///;s/.git$//')
token=$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

#https://github.com/maxl-13/Workflow_Bachelorarbeit.git

#maxl-13/Workflow_Bachelorarbeit

generate_post_data()
{
  cat <<EOF
{
  "tag_name": "$version",
  "target_commitish": "$branch",
  "name": "$version",
  "body": "$text",
  "draft": false,
  "prerelease": false
}
EOF
}

echo "Create release $version for repo: $repo_full_name branch: $branch"
curl -H 'Authorization: token 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' --data "$(generate_post_data)" "https://api.github.com/repos/$repo_full_name/releases?access_token=$token"