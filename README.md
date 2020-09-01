Zish's Chitter App
=======================
## Description
This Sinatra web app allows users post to and read from a feed of posted messages (peeps). It also allows users to sign-up and login to control their own posts.

#### Technologies used

- Ruby
- PostgreSQL (database manager)
- Rspec (test framework)
- Sinatra (Ruby web framework)
- Capybara (web feature test library)

#### Personal motivation

- Building a web app with a database
- Improved debugging process for web and database applications
- Use of and better understanding of the Object Relational Model (ORM) design pattern

## Steps to download

1. Fork this [repo](https://github.com/ZishJawaid/chitter-challenge)

2. `git clone git@github.com:<userName>/chitter-challenge.git` onto your local machine

3. Run `bundle` in the root of the project


## Database setup instructions

### Devoloper database setup
1. Connect to psql in terminal `psql postgres`
2. Run `CREATE DATABASE chitter;`
3. Run `psql \c chitter;` (to connect to new db)
4. Create `peeps` table using the query saved in `01_create_peeps_table.sql`

### Test database setup
1. Connect to psql in terminal `psql postgres`
2. Run `CREATE DATABASE chitter_test;`
3. Run `psql \c chitter;` (to connect to new db)
4. Create `peeps` table using the query saved in `01_create_peeps_table.sql`

### Create users table (in both dev and test dbs)
1. Run `psql \c chitter;` (to connect to dev db)
2. Create `users` table using the query saved in `02_create_users_table.sql`
3. Repeat for `chitter_test` db

### Add user_id column to peeps table (both dev and test dbs)

1. Run `psql \c chitter;` (to connect to dev db)
2. Add `user_id` column to `peeps` table using the query saved in `03_add_user_id_to_peeps_table.sql`
3. Repeat for `chitter_test` db

## Steps to run

1. Run `ruby app.rb` or `rackup -p 4567` in root project directory

2. Visit `http://localhost:4567/peeps`

## To run tests
Run `rspec` directly in root of your local project

## My approach

1. Break down first user stories into an object model and simple feature steps

    #### Problem breakdown

    ##### User story 1 - Post a peep

    ```
    As a Maker
    So that I can let people know what I am doing  
    I want to post a message (peep) to chitter
    ```
    ##### Object model
    Object | Messages
    --------------- | --------------------
    Maker (user) | 
    Peep | .create

    #### Feature breakdown

    * Can enter message (peep)
    * POST peep
    ------
    ##### User story 2 - See all peeps
    ```
    As a maker
    So that I can see what others are saying  
    I want to see all peeps in reverse chronological order
    ```
    ##### Object model
    Object | Messages
    --------------- | --------------------
    Maker (user) | 
    Peep | .create
    Peep | .all

    #### Feature breakdown

    * Can view all peeps
    * Can view all peeps in correct order
    ------
    ##### User story 3 - See time of peep
    ```
    As a Maker
    So that I can better appreciate the context of a peep
    I want to see the time at which it was made
    ``` 
    ##### Object model

    Object | Messages
    --------------- | --------------------
    Maker (user) | 
    Peep | .create
    Peep | .all

    #### Feature breakdown
    * Can view time of peep
    -----
    ##### User story 4 - Sign-up
    ```
    As a Maker
    So that I can post messages on Chitter as me
    I want to sign up for Chitter
    Notes
    - Makers sign up to chitter with their email, password, name and a username
    - The username and email are unique
    - Peeps (posts to chitter) have the name of the maker and their user handle__
    ```
    ##### Object model

    Object | Messages
    --------------- | --------------------
    Maker (user) | sign_up
    Peep | .create
    Peep | .all

    #### Feature breakdown
    * New table -> `user` in chitter db
    * A user `has a` (many) peeps, so user_id should be included in the `peeps` table as a foreign key
    ```

    CRCs
    ----
                          Peep
    ----------------------------------------------------------
      Responsibilities      |        Collaborator
                            |
        knows message       |            user
     knows when created     |
         knows user         |
     
                          User
    ----------------------------------------------------------
      Responsibilities      |        Collaborator
                            |
          knows name        |
          knows email       |
        knows password      |
        knows username      |


    TABLES
    ------
    Peeps
    |  id   |     message      |   created_at   |    user_id   |
    |-------|------------------|----------------|--------------|
    |  001  |  My first peep!  |   #timestamp   |      001     |


    Users
    |  id   |     name     |       email      |  password    |   username   |
    |-------|--------------|------------------|--------------|--------------|
    |  001  |   Zish J     |  zish@makers.com |  p@ssword123 |   zeedizzle  |
    ```
* User still sees full list of peeps (as per requirement)
* User may sign-up (`users/new`?)
* (Add user's name to the session, so it can be used for all newly created peeps)
* Any new peeps should display the user's name and username


2. Add capybara config requirements into `spec_helper.rb`
    - `config.include Capybara::DSL`
    - `require File.join(File.dirname(__FILE__), '..', 'app.rb')`
3. Add necessary gems to Gemfile (`sinatra` as a minimum at this stage)
4. Write first feature test - testing infrastructure on `home (/)` route
5. Make it pass by following command line error messages
    - `LoadError` requiring `app.rb` controller
    -  Index `"/"` route required
6. Check in client by running `ruby app.rb` and visiting `localhost:4567`
7. Extract `view` by creating `index.erb` view file for `"/"` route
8. Initial commit and push to github
10. Test drive first user story (posting a peep) using Capybara feature tests and Rspec unit tests
    - `peeps/new` GET route
    - postgres db and peeps table setup
    - extract `peep` class, requiring `pg` gem
    - `peeps/new` POST route
11. Repeat red/green/refactor process using feature and unit tests
    
#### Structure
- Controller: `app.rb`
- Views: `views/<name>.erb`
- Models: `lib/<name>.rb`
- Migrations: `db/<name>.sql`