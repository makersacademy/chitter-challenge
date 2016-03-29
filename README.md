Chitter Challenge
=================



```sh
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a Maker
So that I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```
Testing and metrics
-------------------
Testing is via RSpec, coveralls support is integrated

Copyright notice
----------------
This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program.  If not, see <http://www.gnu.org/licenses/>.

Documentation instructions
--------------------------
- Specification consists of Rspec tests in ./spec/

Package dependencies
--------------------
The key technologies used by this project include:
- DataMapper ORM
- Postgres
- BCrypt
- Sinatra

See Gemfile for full dependencies

Installation instructions
-------------------------
- clone from https://github.com/peteburch223/rps-challenge.git
- run `bundle` to ensure necessary gems are installed and available
- test with `coveralls report`
- start webserver with Rackup
- access the app at localhost:9292

Project created in Ruby v2.2.3

Authors
-------
Initial coding: Pete BURCH - peteburch223@gmail.com
