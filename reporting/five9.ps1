# Constants
$AWSProfile = "five9prod"
$s3Bucket = "647117382455-five9-snowflake"
# List of Reports
#$reports = "Agent Disposition Report (Global)", "Agent Information (Global)", "Agent Login-Logout (Global)", "Agent Ready and Call Data by Day (Global)", "Agent States by Day (Global)", "Missed Calls - All Teams", "Ready States by Agent by Interval (Global)", "Reason Codes by Interval (Global)", "Survey Report (Global)", "Updated Dispositions Reporting/Forecasting", "Queue Quality of Service by Interval,Voicemails Export", "Call Log - Full"
for ( $reportNum = 0; $reportNum -lt 10; $reportNum++ ) {
switch ( $reportNum )
{
    0 { $prefix = 'AgentDisp'     }
    1 { $prefix = 'AgentInfo'     }
    2 { $prefix = 'AgentLogin'    }
    3 { $prefix = 'AgentReady'    }
    4 { $prefix = 'AgentStates'   }
    5 { $prefix = 'MissedCalls'   }
    6 { $prefix = 'ReadyStates'   }
    7 { $prefix = 'ReasonCodes'   }
    8 { $prefix = 'SurveyReport'  }
    9 { $prefix = 'CallLogs'      }
    10 { $prefix = 'UpdatedDisp'  }  #Broken
    11 { $prefix = 'Voicemails'   }  #Broken
}
$filedate =  get-date -Format filedatetime
$infile = "E:\git\Five9-API\reporting\Output\$prefix.csv"
$outfile = "E:\git\Five9-API\reporting\Output\$prefix$filedate.json"
Set-Location "e:\git\five9-api\reporting"
python ".\$prefix.py"
#Write-host $reportNum $infile $prefix$filedate
import-csv $infile | ConvertTo-Json | Add-Content -Path $outfile -Force

# Upload file to S3
Write-S3Object -ProfileName $AWSprofile -BucketName $s3Bucket -Key "five9/$prefix/$prefix$filedate.json" -File $outfile
}
Get-ChildItem "E:\git\Five9-API\reporting\Output\*.json" | Remove-Item