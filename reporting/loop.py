#import boto3
import datetime
import time

AWSProfile = "five9prod"
s3Bucket = "647117382455-five9-snowflake"
prefix = ['AgentDisp','AgentInfo','AgentLogin','AgentReady','AgentStates','MissedCalls','ReadyStates','ReasonCodes','SurveyReport','CallLogs']

criteria_datetime_start = datetime.date.today()
criteria_datetime_end = datetime.date.today() + datetime.timedelta(days=-1)
print(criteria_datetime_start)
print(criteria_datetime_end)
for x in prefix:
  print(x)

# session = boto3.session.Session(profile_name='five9prod')
# s3 = session.resource('s3')
# for bucket in s3.buckets.all():
#     print(bucket.name)