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
x-seeds.rb file to populate initial tags, and rake db:seed

xbasic checkin stats
basic streak functionality
x-populate table with some test data
x-create streak method in user model
x-subtract the datetime objects, multiply by 24, and convert result to integer (this is in hours)

xpluralize on streak / checkin stats (gonna be an issue with the ajax/jquery)

basic post show page on /:username

figure out how to properly increment current streak without calling current_user.current_streak

figure out how to reset a code streak to zero for folks who haven't checked in (something to do with running process_streak when home page loads)

look into whether you should make default checkin title/content nil instead of blank string

7a. post show view
7b. posts view (have a partial that renders a list of links of a user's last 5 posts on home screen)
7c. basic way to navigate through the site users' profiles/posts

make copy more self-evident on show form link - add "(optional)"
minimal mobile version
ajax auto save on checkin form

setup appropriate dependent destroys, db validations, etc.

figure out how to format code within posts

placeholder for rightside feed
8. authorization
checkin reminders via email or sms (choose whichever you'd personally prefer)
form validations, model validations, and error checking (check out sample app for bootstrap error references)
9. get a basic smart feed going (looks at a user's post tags, calculates what they're writing most about, and then populates their feed with those same topics - general posts get shown to everyone)

look into caching in model so you don't have to call db everytime to check streak

add some kind of "don't break the chain" type visualization

10. styling similar to hulkort .com or old school terminal looking?

take note of current gem version numbers, and then update gemfile with explicit versions

user has many checkins
checkin belongs to user

checkin
id		title 		content		 user_id

checkin (new columns)
