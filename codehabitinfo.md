x1. add twitter bootstrap
x1a. add header nav bar
x2. temporary landing page with "hero" box
x3. github authentication
x add email to user model
x4. basic profile section with gravatar and github profile info
x5. placeholder for streak boxes
xcheckin functionality
xjquery to show/hide checkin forms
xajax for checkin
xfallback behavior if js/jquery is off

use chosen plugin for tags on the checkin form (rails, ruby, python, CSS, html, etc)
x-create models and associations
x-add chosen plugin
-seeds.rb file to populate initial tags, and rake db:seed

make copy more self-evident on show form link - add "(optional)"
checkin stats
minimal mobile version
ajax auto save on checkin form
7. post functionality - figure out how to format code within posts - use checkboxes for tagging? "rails ruby python django java general other" etc
7a. post show view
7b. posts view (have a partial that renders a list of links of a user's last 5 posts)
7c. basic way to navigate through the site users' profiles/posts
placeholder for rightside feed
8. authorization
checkin reminders via email
form validations, model validations, and error checking (check out sample app for bootstrap error references)
9. get a basic smart feed going (looks at a user's post tags, calculates what they're writing most about, and then populates their feed with those same topics - general posts get shown to everyone)
10. styling similar to hulkort .com or old school terminal looking?

user has many checkins
checkin belongs to user

checkin
id		title 		content		 user_id

checkin (new columns)
