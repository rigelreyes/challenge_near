On AWS we have a series of EBS snapshots with the following description syntax:

backup_YYYYMMDDhhmmss[x]

These snapshots are created every hour from the corresponding EBS volumes. 

Write a script in your language of choice (preferably Ruby or Bash) that searches for these snapshots, keeps all the snapshots taken within the last 24 hours, keeps one from the 15th day of each month and deletes the rest. 

Then it gives a report that how many snapshots were deleted and how many are kept.


### Command workflow
pip install aws 
pip install aws-shell
pip install boto3
gem install aws-sdk

