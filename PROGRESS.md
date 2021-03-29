Setup-

Got stuck on the setp up, had to order my requires in this way:

ENV['ENVIRONMENT'] = 'test'
ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app.rb')

require 'simplecov'
require 'simplecov-console'
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'pg'

I also jumped the gun and created a chitter web app class which created a superclass mismatch TypeError

---------------

Setup database-

1. Connect to psql
2. Create the database using the psql command CREATE DATABASE chitter;
3. Connect to the database using the pqsl command \c chitter;
4. Run the query we have saved in the file 01_create_chitter_table.sql

---------------

Setup test database-

1. Connect to psql
2. Create the database using the psql command CREATE DATABASE chitter_test;
3. Connect to the database using the pqsl command \c chitter_test;
4. Run the query we have saved in the file 02_create_chitter_test_table.sql

---------------


*As a Maker*
*So that I can let people know what I am doing*
*I want to post a message (peep) to chitter*

-       After the set up I created my tests, my initial test of "page to have content" failed because it wasn't actually displaying the information. In order to get that test to pass I set about created my Peep class and displaying all peeps on the homepage.

This did not work - I have set up a database and a test database, however now I am getting a NameError for my /homepage:

   NameError:
       undefined local variable or method `peep' for #<ChitterWebApp:0x00007f96e23c1ee8>

I am unsure what the root cause is.
        *I had not required my peeps class*
Now I am getting the following error:

    Failure/Error: visit '/homepage'
     
     NoMethodError:
       undefined method `status' for #<Peep:0x00007fe46613f900>

I'm not sure why I'm getting this error. I'm trying to iterate over each element in my peeps array and call the status only.

<ul>
<% Peep.all_peep.each do |element| %>
    <li class="peep">
        '<%= element.status %>'
    </li>
<% end %>
</ul>

I've done something similar in the afternoon challenge and that functions as expected.
            *I had forgotten to require PG and alter my setup_test_database.rb code*

New error!

    Failure/Error: expect(peep_status).to include ('Peep peep!')
     
       expected [#<Peep:0x00007fa20c300b28 @user_id="test_user", @status="Peep peep!", @id="110">, #<Peep:0x00007fa20c300a88 @user_id=nil, @status="Peep peep!", @id="111">] to include "Peep peep!"
       Diff:
       @@ -1,2 +1,3 @@
       -["Peep peep!"]
       +[#<Peep:0x00007fa20c300b28 @user_id="test_user", @status="Peep peep!", @id="110">,
       + #<Peep:0x00007fa20c300a88 @user_id=nil, @status="Peep peep!", @id="111">]

Its not returning "Peep peep!". Why. Went from each to map, no difference.

Perhaps there is something wrong with the test? It is failing at line 11:

    10: peeps = Peep.all_peep
    11: expect(peeps).to include ('Peep peep!')

--- I've decided to temporarily move onto the adding peeps functionality ---

Peep status is returning as [:status] and yet again I am unsure. Changing everwhere I put [:status] until something happens.

...

That didn't take long, it was in app.rb:

        post '/peep' do
             p params
        
             Peep.post_peep(params[:user_id], [:status])
       
            erb(:add_peep)
        end

BECAUSE IS SHOULD BE params [:status]

Now it is coming up blank.

---Realised that one of my failing tests (expecting 2 arguments given 0) was a result of me not giving the test an argument---

I'm absolutely stuck and exhausted, I feel like I was following a similar process to the afternoon challenge but it appears like I wasn't.