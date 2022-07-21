Chitter
=================
This app can be accessed on Heroku: https://immense-ravine-46955.herokuapp.com/

Technologies used in this repository:

* Ruby
* RSpec
* Sinatra
* PostgreSQL

To set up this app on your local machine, first fork, then clone this repository. Before following the steps below:
```bash
#From within this repository run the following setup:

bundle install

rackup
#Run this in a seperate terminal to start the server. Server can be accessed on localhost:9292

rspec spec/.
#Run this to run all the tests. They should all pass
```