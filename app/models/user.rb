class User < ActiveRecord::Base
  has_many :checkins
  has_many :streaks

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.username = auth.info.nickname
      user.name = auth.info.name
      user.email = auth.info.email
      user.save!
    end
  end

  def process_streak
    # returns true if streak should be incremented by 1. using this value
    # in the view to know whether I should update stats with jQuery.
    puts "+=============================================+"
    puts "+=============================================+"
    puts "+=============================================+"
    puts "+=============================================+"
    last_checkin = self.checkins.where("checkins.id IS NOT NULL").last
    if last_checkin
      right_now = Time.now.utc
      last_checkin_time = last_checkin.created_at
      diff_in_hours = ((right_now - last_checkin_time) / 3600).to_i
      # This would make more sense if I could put a ? mark
      # at the end of the variable, but that's invalid syntax
      on_same_day = (last_checkin_time.to_date === right_now.to_date)

      if diff_in_hours <= 24 && !on_same_day
        if self.streaks
          self.streaks.last.num_days += 1
          puts "in the first if of the process_streak"
        else
          self.streaks.create
        end
        return true
      elsif diff_in_hours <= 24 && on_same_day
        # do nothing - don't add to the streak
        puts "in the elsif of the process_streak"
        return false
      else
        # start a new streak
        self.streaks.create
        self.streaks.last.num_days = 1
        puts "in the else of the process_streak"
        return true
      end
    else
      # user has no checkins, thus no streaks, so create a streak
      self.streaks.create
      return true
    end
  end

  def current_streak
    # I don't like that I'm repeating myself here, but for now, I just want
    # to get this working.
    puts "+=============================================+"
    puts "+======inside the current_streak==============+"
    puts "+======inside the current_streak==============+"
    puts "+=============================================+"
    puts "self.checkins.count is #{self.checkins.count.inspect}"
    puts "self.checkins.last is #{self.checkins.where("checkins.id IS NOT NULL").last.inspect}"
    last_checkin = self.checkins.where("checkins.id IS NOT NULL").last
    if last_checkin
      right_now = Time.now.utc
      puts "right_now: #{right_now}"
      last_checkin_time = last_checkin.created_at
      puts "last_checkin: #{last_checkin.inspect}"
      diff_in_hours = ((right_now - last_checkin_time) / 3600).to_i
      puts "diff_in_hours: #{diff_in_hours.inspect}"
      on_same_day = (last_checkin_time.to_date === right_now.to_date)
      puts "I'm in the first continue_streak if block"
      if diff_in_hours > 24
        puts "diff_in_hours is > 24 and = #{diff_in_hours}"
        return 0
      elsif diff_in_hours <= 24 && self.streaks
        puts "diff_in_hours is #{diff_in_hours}"
        return self.streaks.last.num_days
      end
    end
    return 0
  end
end
