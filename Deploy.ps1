# Trigger the GitHub Actions workflow
$workflowUrl = "https://github.com/$OWNER/$REPO/actions/workflows/Build-Test-Deploy.yml"
$workflowToken = "$WORKFLOW_TOKEN"  # Access token with workflow_runs permission

$jsonBody = "{ 'ref': 'main' }"  # Trigger workflow on main branch

Invoke-RestMethod -Uri $workflowUrl -Method Post -Headers @{ "Authorization" = "Bearer $workflowToken" } -Body $jsonBody -ContentType "application/json"