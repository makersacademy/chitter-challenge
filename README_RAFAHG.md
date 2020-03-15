## CHITTER WEB APP CHALLENGE.

### Fist step.

In this challenge i will try to build an message app, called Chitter.

In this first stage of the project. I am gonna follow the following steps:

- Setup the project.
- Create a first welcoming message to the app.
- Test the code in a feature test in the most basic way.

The first commit include until here.

------------------------------------------------------------------------------
### Second step.

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

To implement that requirement i have followed this steps to comply in the most
simple way.

- In app.rb i have created the following get and post requests:

```

  get '/' do
    # now the message is delivered in the erb file. index.erb
    # "This is Chitter, your instant message service!"
    erb :index
  end

  post '/peeps/new' do
    redirect '/peeps'
  end

  get '/peeps' do
    "New peep posted"
  end

  ```

  Within the MVC model those request are referenced to the erb file index.erb, which, in this step, has this content:

  ```
  <h2>This is Chitter, your instant message service!</h2>

<form action="/peeps/new" method="post">
  <input type="text" name=peep placeholder="Post your peep" required>
  <input type="submit" value="New peep">
```  

At this point, all the test are passing and the web app is able to send a peep and received a message in the index page wich inform the user that the message has been posted.

 - At this point i am making my second commit.
-------------------------------------------------------------------------------

## THIRD STEP.

In this step i am starting to refactor the MVC, i want at this point that the user can insert as many peeps as he wants. At this poing i am gonna create a hard code just for the 3 initial messages, which will be displayed in the screen.
To do that i created a separated class with a method which return an array of 3 messages.
The array have been tested, and of course at this stage the test are failing because, just to show the difference in the code in smaller steps i am not going to implement the views code.

So at this point:

- Class Peep has been created. in peep.rb
- Test for the method #posted_peeps has been implemented.
- Feature test for peeps.erb showing the very fist message has been implemented.

At this point i am making my third commit.

------------------------------------------------------------------------------
## FORTH STEP
- Little implementation just to adjust with the goals of the last steps.
At this poing peeps.erb is implemented with the html and ruby code to show properly the hard code array which return the method #posted_peeps.

- Tests are implemented for the class and the method and at this point all is green, even my friend rubocop is giving me its total permission to go forward.

At this point i am making my forth commit.

------------------------------------------------------------------------------
## FITH STEP. CREATING DATABASES

- In this step of the web app implementation i will create the databases and the test enviroment for them.

    ----INTRUCTIONS TO CREATE THE DATA BASES-----

    1. First of all get into psql and type the following
       ```
       > CREATE DATABASE chitter;
       > CREATE TABLE peeps (id SERIAL PRIMARY KEY, body VARCHAR(200));
       ```
    2. Repeat the process for the test database.
      ```
      > CREATE DATABASE chitter_test;
      > \c chitter_test
      > CREATE TABLE peeps (id SERIAL PRIMARY KEY, body VARCHAR(200));
      ```
    3. Once the above is done we have 2 databases, one for the real app and the other one for testing purposes.

    The carachteristics of both of them are stored by me previously in:
      - db/migrations/01_create_chitter_database.sql
      - db/migrations/02_create_chitter_test_database.sql

      --- SETTING THE TEST ENVIROMENT ---

      1. In spec/spec_helper.rb

         ```
         require_relative './setup_test_database'
         ENV['ENVIROMENT'] = 'test'
         RSpec.configure do |config|
           config.before(:each) do
             setup_test_database
           end
          end

### rest of the file ###

            ```
        2. in spec/setup_test_database.rb

           ```
           require 'pg'

           def setup_test_database

           connection = PG.connect(dbname: 'chitter_test')

           connection.exec("TRUNCATE chitter_test;")

           end
           ```

  ----------------------------------------------------------------------------

   Once the databases and the test enviroment is configured it is time to run the test(which are going to fail horrendously) and refactor the code to move forward from a hardcoding mode a database mode.

     As it is possible to see in the code of this commit, the Peep class have been refactored to reference to the database as the tests in a similar way.
    At the end of this step it is possible to test the database proper functionality and i am ready to implement methods to add data to the dababase and test it.

    At this point i am making my fith commit.

    --------------------------------------------------------------------------
