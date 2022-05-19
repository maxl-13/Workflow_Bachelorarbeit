curl \
  -X POST \
  -H "Accept: application/vnd.github.v3+json" \
  https://api.github.com/repos/maxl-13/Workflow_Bachelorarbeit/releases \
  -d '{"tag_name":"v1.0.0","target_commitish":"master","name":"v1.0.0","body":"Description of the release","draft":false,"prerelease":false,"generate_release_notes":false}'

curl -H 'Authorization: token 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' --data '{"tag_name": "v5.0.4","target_commitish": "main","name": "v5.0.3","body": "Release of version 1.0.0","draft": false,"prerelease": false}' https:// https://github.deere.com/api/v3/repos/MPS/NETStandard-lib/releases?access_token=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
 
 
 
 https://github.deere.com/api/v3
 
  curl -X POST -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/maxl-13/Workflow_Bachelorarbeit/releases -d '{"tag_name":"v3.0.3","target_commitish":"main","name":"v3.0.3","body":"Description of the release","draft":false,"prerelease":false,"generate_release_notes":false}'