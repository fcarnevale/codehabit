# namespace :db do 
#   desc "Fill dates table with dates"
#   task :populate => :environment do 
#   	start_date = Date.new(2013, 1, 1)
#     end_date = Date.new(2023, 12, 30)
#     date = start_date

#     while date <= end_date
#       DatesForStreak.create(date: date)
#       date += 1	
#     end
#   end
# end