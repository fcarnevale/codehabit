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
      # if user.streaks.count == 0
      #   user.streaks.build
      # end
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
      last_checkin_date = last_checkin_time.to_date
      back_to_back = (last_checkin_date == right_now.to_date.yesterday)

      # diff_in_hours = ((right_now - last_checkin_time) / 3600).to_i
      # This would make more sense if I could put a ? mark
      # at the end of the variable, but that's invalid syntax
      on_same_day = (last_checkin_time.to_date === right_now.to_date)

      if back_to_back
        self.streaks.last.num_days += 1
        self.save
        puts "in the first if of the process_streak"
        return true
      elsif on_same_day
        # do nothing - don't add to the streak
        puts "in the elsif of the process_streak"
        return false
      else
        # start a new streak
        self.streaks.build
        self.streaks.last.num_days = 1
        self.save
        puts "in the else of the process_streak"
        return true
      end
    else
      # user has no prior checkins, thus no streaks, so create a streak
      self.streaks.build
      self.streaks.last.num_days = 1
      self.save
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
      right_now_date = right_now.to_date
      puts "right_now: #{right_now}"
      last_checkin_time = last_checkin.created_at
      last_checkin_date = last_checkin_time.to_date
      back_to_back = (last_checkin_date == right_now.to_date.yesterday)
      puts "last_checkin: #{last_checkin.inspect}"
      days_apart = ((right_now_date - last_checkin_date).to_i)
      # diff_in_hours = ((right_now - last_checkin_time) / 3600).to_i
      # puts "diff_in_hours: #{diff_in_hours.inspect}"
      on_same_day = (last_checkin_time.to_date === right_now.to_date)
      puts "I'm in the first continue_streak if block"
      if days_apart > 1
        return 0
      elsif days_apart < 1 && self.streaks.count > 0
        return self.streaks.last.num_days
      end
    end
    return 0
  end
end
