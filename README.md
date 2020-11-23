Chitter Challenge
=================

* Feel free to use Google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

Challenge:
-------

As usual please start by forking this repo.

We are going to write a small Twitter clone that will allow the users to post messages to a public stream.

Features:
-------

```
STRAIGHT UP

As a Maker
So that I can let people know what I am doing  - SOLVED
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order - SOLVED

As a Maker
So that I can better appreciate the context of a peep - SOLVED
I want to see the time at which it was made

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

HARDER

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

ADVANCED

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

### Set up:
```ruby
#in spec_helper.rb
ENV['ENVIRONMENT'] = 'test'
require 'capybara/rspec'
require 'capybara'
require 'rspec'
require 'simplecov'
require 'simplecov-console'

require File.join(File.dirname(__FILE__), '..', 'app.rb')
Capybara.app = Chitter
```

Our first two tables were set up with this structure. One in the 'chitter' database and the other in 'chitter_test'. This can be found in db/migrations directory
```ruby
#in db/migrations/01_create_cheeps_table.sql
CREATE TABLE cheeps(id SERIAL PRIMARY KEY, cheep VARCHAR(240));
```

## User Story 1:
First of all I'll be tackling the first user story.
```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter
```
To me, this means that the user needs to be able to post or create a peep and see it. 

 1. Create '/cheeps' route. This will display all cheeps using a Cheeps.all method in the model
 2. Create '/cheeps/new' route. This will allow the user to create a new cheep. This will use Cheeps.create(text) method

## User Stories 2 & 3

I'll be tackling these two stories together as for me they go hand in hand. I will tackle user story 3 first to make it easier to see if they are in chronological order or not.

```
As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

### To view the time on a cheep:

 1. I'll have to add a column in the database for this, which in turn means I need to add it into the .create method
 2. add an initialize method & attr_readers
 3. return a ruby object from .all
 4. change .create to return a ruby object
 5. change views/index to display a table for each cheep, with each table footer showing the cheep's time stamp

Below is the command used to alter the cheeps table to also accept time/
```ruby
ALTER TABLE cheeps ADD COLUMN time TIME;
```

### To view cheeps in reverse order

 1. create a button that takes you to cheeps/reverse (probably not very restful, I'll look into this later if time allows)
 2. create a .reverse method which simply calls .all.reverse
 3. create a views/cheeps/reverse.erb file which mirrors views/cheeps/index.erb

To make it clearer and easier to organise I added my cheeps into tables with the time stamp being put into the table footer. This would have allowed me to add the user name into the header of the table but I ran out of time.

```ruby
#in views/cheeps/index.erb & /reverse.erb
<ul>
  <% @cheeps.each do |cheep| %>
  <table>
    <tbody>
      <tr>
        <td><%= cheep.cheep %></td>
      </tr>
    </tbody>
    <tfoot>
      <tr>
        <td><%= cheep.time %></td>
      </tr>
    </tfoot>
  </table>
  <% end %>
</ul>
```
