TAGS: coveralls travis and stuff.

Instructions:
------
* This is a clone of twitter
* Download, check ruby version, run $ bundle
* Create a clean database, and set its address to $DATABASE_URL
* Run $ Rake migPro once before starting, and again if you want to scrub the DB
* Run $ rackup and connect to localhost:9292
* Instance available at https://frozen-fortress-63985.herokuapp.com/

Description:
------
* stuff

Notes:
------
* rambling
complete testing
flash overuse
controllers
actual partials
layout not needed anymore (single page)
input validation
guards (fat controller for now)
where to test what
extremely easy to get 100% coveralls
too much logic in views (especially presenting peeps)
require chains
travis



TODO:
------
* remove this section before last commit
* html5
* extract from controller to model
* extract from view to...somewhere
* edge cases and validation
  - user/mail already taken on register
  - empty user/pwd/mail
  - more edges
* followers
* display random peeps when not logged, follower(s) ones+few random ones when logged in
