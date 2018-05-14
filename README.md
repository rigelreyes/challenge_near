## Challenge Instructions
On AWS we have a series of EBS snapshots with the following description syntax:

backup_YYYYMMDDhhmmss[x]

These snapshots are created every hour from the corresponding EBS volumes. 

Write a script in your language of choice (preferably Ruby or Bash) that searches for these snapshots, keeps all the snapshots taken within the last 24 hours, keeps one from the 15th day of each month and deletes the rest. 

Then it gives a report that how many snapshots were deleted and how many are kept.


## Command workflow
First we need to install python for the aws and aws-shell functionality on cli, but for the purpose on the ruby script we just need to install the aws-sdk.

```bash
pip install aws 
pip install aws-shell
pip install boto3
gem install aws-sdk
```
## Explanation
As this is a Date-Time script related I decided to use the active-support library, this comes handy when you want to compare dates, as makes the code more maintanable and scalable. I'm using the aws-sdk for ruby, I found it to be more practical than just invoke aws from the os-cli. An improvement could be a menu where you can pick the region.