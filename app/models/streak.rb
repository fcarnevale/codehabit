class Streak < ActiveRecord::Base
  # attr_accessible :num_days, :user_id
  belongs_to :user
  after_initialize :init

  def init
  	self.num_days ||= 0
  end
end
