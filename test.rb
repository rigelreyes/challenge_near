require 'aws-sdk-ec2'  # v2: require 'aws-sdk'
require 'time'
require 'active_support/core_ext/numeric/time.rb'

time_now = DateTime.now 
puts "#{time_now}"
puts "#{time_now.day}"

snap = "backup_20150506201515[x]"
year = Integer(snap[7..10])
month = Integer(snap[11..12])
day = Integer(snap[13..14])
hour =  Integer(snap[15..16])
minutes = Integer(snap[17..18])
seconds = Integer(snap[19..20])
time_snap = DateTime.new(year, month, day, hour, minutes, seconds)
puts "#{time_snap+24.hours+40.minutes}"