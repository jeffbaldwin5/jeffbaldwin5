# Constants
$AWSProfile = "five9prod"
$s3Bucket = "647117382455-five9-snowflake"
Set-Location "e:\git\five9-api\reporting\Testoutput"

$prefix = (
'AgentDisp',
'AgentInfo',
'AgentLogin',
'AgentReady',
'AgentStates',
'MissedCalls',
'ReadyStates',
'ReasonCodes',
'SurveyReport',
'CallLogs')

#python ".\loop.py"
#Write-host $reportNum $infile $prefix$filedate
Set-Location "E:\git\five9-api\reporting\Testoutput"
$files = get-childitem *.csv
foreach($file in $files){
    Import-Csv $file | ConvertTo-Json | Add-Content -Path ($file -replace ".csv", ".json") -Force
}



# Upload file to S3
# foreach ($folder in $prefix) {
# $folder
# Write-S3Object -ProfileName $AWSprofile -BucketName $s3Bucket -Key "five9/$folder/" -Folder ".\$folder"
# }
# #Get-ChildItem "E:\git\Five9-API\reporting\Output\*" | Remove-Item

# 
