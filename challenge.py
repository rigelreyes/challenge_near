import boto3
import re
import time
import datetime

region = 'us-west-1'
client = boto3.client('ec2', region_name=region)
rsrc = boto3.resource('ec2', region_name=region)

time_now = datetime.datetime.now()
response = client.describe_snapshots()

for snap in response['Snapshots']:
    if re.match("^backup_\d{4}(0?[1-9]|1[012])(0?[1-9]|[12][0-9]|3[01])([01]?\d|2[0-3])([0-5]?\d)([0-5]?\d)\[.{0,}\]$", snap['Description']):
        year = int(snap['Description'][7:10])
        month = int(snap['Description'][11:12])
        day = int(snap['Description'][13:14])
        hour =  int(snap['Description'][15:16])
        minutes = int(snap['Description'][17:18])
        seconds = int(snap['Description'][19:20])
        time_snap = datetime.date(year, month, day, hour, minutes, seconds)
        if time_snap < time_now.timedelta(days=-1) :
            if time_now.days != 15 :
                print( "The snapshot: " + snap['Description'] + " with ID " + snap['Id'] + " is now being deleted..." )
                client.delete_snapshot({"snapshot_id": snap['Id']})
        else:
            print( "The snapshot: " + snap['Description'] + " with ID " + snap['Id'] + " will remain stored..." )
    else:
        print( "The snapshot: " + snap['Description'] + " with ID " + snap['Id'] + " is now being deleted..." )
        client.delete_snapshot({"snapshot_id": snap['Id']})
