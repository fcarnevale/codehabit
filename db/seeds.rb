# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create initial tag values

topic_tags = [
  "Ruby", "Rails", "HTML", "CSS", "JavaScript", "CoffeeScript", "jQuery",
  "PHP", "Python", "Django", "TDD", "Meteor", "General", "Other"
]

topic_tags.each do |topic|
  Tag.find_or_create_by_name(topic)	
end