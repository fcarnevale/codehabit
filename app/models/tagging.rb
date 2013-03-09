class Tagging < ActiveRecord::Base
  belongs_to :checkin
  belongs_to :tag
end