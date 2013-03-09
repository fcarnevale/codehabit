class Checkin < ActiveRecord::Base
  attr_accessible :content, :title, :tag_ids
  belongs_to :user
  has_many :taggings
  has_many :tags, through: :taggings
end
