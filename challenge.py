import boto3
import json
import re


ec2 = boto3.client('ec2')
response = ec2.describe_snapshots()
for snap in response:
    print('Product: ' + snap[0])
#print(response)

