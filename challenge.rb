require 'aws-sdk-ec2'  # v2: require 'aws-sdk'
require 'time'
require 'active_support/core_ext/numeric/time.rb'

region = 'us-west-1'

rsrc = Aws::EC2::Resource.new(region: region)
client = Aws::EC2::Client.new(region: region)      
# To only get the first 10 instances:
# ec2.instances.limit(10).each do |i|

time_now = DateTime.now

rsrc.snapshots.each do |snap|
  if "#{snap.description}" =~ /^backup_\d{4}(0?[1-9]|1[012])(0?[1-9]|[12][0-9]|3[01])([01]?\d|2[0-3])([0-5]?\d)([0-5]?\d)\[.{0,}\]$/
    year = Integer(snap[7..10])
    month = Integer(snap[11..12])
    day = Integer(snap[13..14])
    hour =  Integer(snap[15..16])
    minutes = Integer(snap[17..18])
    seconds = Integer(snap[19..20])
    time_snap = DateTime.new(year, month, day, hour, minutes, seconds)
    if time_snap < time_now - 24.hours
      if time_now.day != 15
        puts "The snapshot: #{snap.description} with ID #{snap.id} is now being deleted..."
        client.delete_snapshot({snapshot_id: "#{snap.id}"})
      end
    end
    puts "The snapshot: #{snap.description} with ID #{snap.id} will remain stored..."
  else
    puts "The snapshot: #{snap.description} with ID #{snap.id} is now being deleted..."
    client.delete_snapshot({snapshot_id: "#{snap.id}"})
  end  
end

