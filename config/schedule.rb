# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
 every 2.hours do
   runner "YoutubeFeedEntry.update_entries('rumors')"
   runner "TwitterFeedEntry.update_entries('rumors')"
   runner "RssFeedEntry.update_entries('http://www.thewarblersnest.com/feed/')"

  
end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
