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
    puts "+=============================================+"
    puts "+============inside process_streak============+"
    puts "+============inside process_streak============+"
    puts "+=============================================+"
    
    has_streak = self.streaks.last
    right_now = Time.now.utc

    if has_streak
      yesterday_checkin = self.checkins.where("checkins.id IS NOT NULL AND DATE(created_at) = DATE(?)", right_now.to_date.yesterday).last
      last_checkin = self.checkins.where("checkins.id IS NOT NULL").last
      on_same_day = (last_checkin.created_at.to_date === right_now.to_date)

      if yesterday_checkin and !on_same_day
        self.streaks.last.increment!(:num_days)
        return true
      elsif on_same_day
        # Do nothing
        return false
      else
        self.streaks.last.toggle(:is_active)
        self.streaks.build
        self.streaks.last.increment!(:num_days)
        puts "in the else of process_streak"
        return true        
      end
    else
      self.streaks.build
      self.streaks.last.increment!(:num_days)
      puts "in the second else of process_streak"
      return true
    end
  end

  def current_streak
    has_streak = self.streaks.last
    right_now = Time.now.utc
    right_now_date = right_now.to_date

    if has_streak
      yesterday_or_today = self.checkins.where("checkins.id IS NOT NULL AND DATE(created_at) >= DATE(:start_date) AND DATE(created_at) <= DATE(:end_date)", {start_date: right_now_date.yesterday, end_date: right_now_date})
      return self.streaks.last.num_days if yesterday_or_today
    end
    return 0
  end
end
