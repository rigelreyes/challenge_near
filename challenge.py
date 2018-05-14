import boto3
import re

region = 'us-west-1'
client = boto3.client('ec2', region_name=region)
rsrc = boto3.resource('ec2', region_name=region)

response = client.describe_snapshots()

for snap in response['Snapshots']:
    if re.match("^backup_\d{4}(0?[1-9]|1[012])(0?[1-9]|[12][0-9]|3[01])([01]?\d|2[0-3])([0-5]?\d)([0-5]?\d)\[.{0,}\]$", snap['Description']):
        print("Matches'")    
    else:
        print("Not matches")
