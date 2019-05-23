# Paul's Chitter Challenge

[![Build Status](https://travis-ci.org/makersacademy/chitter-challenge.svg?branch=master)](https://travis-ci.org/makersacademy/chitter-challenge)

*[Exercise instructions](INSTRUCTIONS.md)*

<img src='img/animation.gif'>

## Chitter

Like Twitter but way better

Using:
- Ruby
- Sinatra
- PostgreSQL database
- DataMapper ORM
- RSpec/Capybara for testing
- Bootstrap CSS
- Heroku + Heroku Postgres
and last but not least,
- Vim. This was the first time I did the whole challenge in Vim, so that was nice.

Check it out here: <https://hivemind-chitter.herokuapp.com/>

## Installation

1. Clone the repo
2. `bundle install`
3. Set up your databases and user e.g. by running:  
   `psql -f db/migrations/set_up_databases.sql`
4. Copy `.env-example` to `.env`. (`.env` is included in `.gitignore` in case you want to keep your database credentials secret)
5. Start the server with `rackup`
6. Go to [`localhost:9292`](http://localhost:9292) in your browser

## Tests

1. Run the tests with `rspec` in the project root

## What I did

I implemented all the user stories except the last one. I didn't look at the bonus task about replying to peeps. I did a little bit of styling with Bootstrap.

I used DataMapper for an ORM (seems *much* easier than dealing with the database directly!)

It took me a couple of goes to set the database up correctly, but the Travis build is passing.

I deployed to Heroku using the Heroku CLI. Heroku Postgres was pretty easy to [configure via DataMapper](https://devcenter.heroku.com/articles/rack#using-datamapper-or-sequel).

Databases are uniquely named (i.e. called "hivemind_chitter" instead of just "chitter") so they won't conflict with anyone else's that I download and install, or vice versa.

TDD-ed everything, but almost all the model logic was handled by DataMapper, so there wasn't much in the way of unit tests, which felt... weird... Test coverage is ~98%: everything except the lines setting up the database in the development and 'production' environment.

### Things I could have done differently

No doubt this list will increase dramatically when I properly go over the rubric, but for now...

- Would have been good to do the bonus round:
    - Create many-to-many join table between peeps and users to represent tags?
- I didn't feel like I was on top of automating the database set-up and deployment. Need to look into Rake more.
- Could have more detailed validation messages on sign-up page. Currently all errors give the same generic message.
- Should do some validation on the length of a peep
- My gif was a bit low-quality :(

[Here are some other notes I made along the way](notes.md)

## Process

This project covered a lot of the same ground as the previous one ([rps-challenge](https://github.com/hives/rps-challenge)), so it's interesting to do a comparison.

### TDD - refactoring

With the [previous weekend challenge](https://github.com/Hives/rps-challenge/) I created problems for myself by neglecting the 'refactor' stage of the RED->GREEN->REFACTOR cycle. This meant that by the time I did come to refactor, the complexity of my program was such that extracting a class was more difficult than it needed to be. With this project I prioritised refactoring as I went along, such as [this early commit](https://github.com/Hives/chitter-challenge/commit/865a76ef4776e509491047cbfbe0cf560f3161a9) where I extracted my `Peep` class, with the result that refactoring steps were smaller and I felt more in control as I progressed to the later stages.

### Database

The database was the new feature of this challenge. I implemented the database functionality successfully, including configuring Travis and deploying to Heroku, but it felt like I was repeating work I had already done, manually configuring the local, test, Travis and Heroku databases. Next time I work on something like this I'd like to try and find a better way to manage that, like a single script to provision the database that could be use in each case.

### Restful routes

Katerina and my mentor both said that my routes were not RESTful on the RPS challenge. My routes didn't map onto resources or actions. For instance [I've got a `post '/choose'` route](https://github.com/Hives/rps-challenge/blob/aae417c45ae552f3f10add35d3b52c05a7712c3c/app.rb) which stores a player's choice, but the name doesn't relate to any resource in the program. The route name should be a noun representing the resource you're interacting with, so something like `post '/turn'` might be better. My non-RESTful routes make it hard to follow the flow in `app.rb` and to work out what's happening in each route.

My [controller](https://github.com/Hives/chitter-challenge/blob/561a0cadc1d9ecc461b9a219dea1695b0c4cd062/app.rb) in the Chitter challenge uses more RESTful routes, such as `get '/users/new'` to present the sign-up page, and `post '/users'` to create a new user. As a result it's easier for someone reading my `app.rb` to understand the flow of my program, and the responsibility of each route.

### Stuff from the rubric

#### Use of flash with partials

I used separate symbols for my flash messages, which is unnecessary. For instance [both](https://github.com/Hives/chitter-challenge/blob/561a0cadc1d9ecc461b9a219dea1695b0c4cd062/app.rb#L34) of [these](https://github.com/Hives/chitter-challenge/blob/561a0cadc1d9ecc461b9a219dea1695b0c4cd062/app.rb#L50) messages are error messages, so it would be better to use a single symbol, like `flash[:error]`. This would allow me to extract both of those error messages into a single partial, which would make my code more DRY. (Refer to [this part](https://github.com/Hives/chitter-challenge/blob/master/docs/review.md#use-partials-with-standard-html-conventions) of the rubric.)

#### Semantic markup

I could have made my markup more semantic by using, for instance, `<article>` for my peeps. I used `<blockquote>` because I liked the way it's styled in Bootstrap, but that is not a good reason! (Refer to [this part](https://github.com/Hives/chitter-challenge/blob/master/docs/review.md#prefer-other-semantic-html-elements-to-divs-where-possible) of the rubric.)

#### Separate routes into separate controller files

Sounds like a good idea. So you could bundle the routes that relate to peeps and the routes that relate to users into their own files. See [this section](https://github.com/Hives/chitter-challenge/blob/master/docs/review.md#split-routes-into-separate-controller-files) of the rubric.

## Post code-review updates

1. [My reviewer pointed out](https://github.com/makersacademy/chitter-challenge/pull/1173#discussion_r270787528) that when getting a single user I was calling `User.all` and storing the results in a variable with the singular name `user`, which was potentially confusing as `User.all` returns an array of users. So I renamed the variable `allUsersWithUsername`, and then store the user in a variable called `user` after checking that only one user was returned. I feel this sequence is clearer, and the renamed variables are more readable. [See the commit here](https://github.com/Hives/chitter-challenge/commit/ade44edce177111e628643bfc33c73ed29841d29#diff-fb67188b0b305cc43fa91d3b80687e15).

2. [My reviewer asked](https://github.com/makersacademy/chitter-challenge/pull/1173#discussion_r270791409) if there was anything I could do to improve the readability of this line in `app.rb`, which retrieves all the peeps in reverse order:
    ```ruby
    @peeps = Peep.all order: [:id.desc]
    ```
    After looking at it I thought that even though this is just a method call using a parameter to set the ordering of the database query, it would be clearer to wrap that in a nicely-named method. This is better because it's more readable, and it extracts responsibility for ordering the query results out of the controller and into the model. So I test-drove a `Peep.allPeepsInReverseOrder` method and used that to get the peeps in `app.rb`. [See the commit here](https://github.com/Hives/chitter-challenge/commit/561a0cadc1d9ecc461b9a219dea1695b0c4cd062).

3. [My reviewer asked me](https://github.com/makersacademy/chitter-challenge/pull/1173#discussion_r270786288) how I knew a particular peep was giving back the right data. I know that because the database is cleared between each test, so I only get back what I put in in each test. But the comment did make me realise that the test was potentially giving me false positives for a different reason. See [the commit message](https://github.com/Hives/chitter-challenge/commit/5df7d2caa21a79a23c7401ffcb660dd7763f0634) for more details.

I asked Alice to have a look at these updates. She said:

> The first two are the most interesting to me, as they are clear readability and extendibility (ease of change) improvements. I [made a comment](https://github.com/Hives/chitter-challenge/commit/561a0cadc1d9ecc461b9a219dea1695b0c4cd062#r33060590) on the second commit, I'll let you read it. If you make a change following that comment, you'll probably see how hiding complexity in that other method makes it easier to change the code.

Following Alice's comment I updated my `Peep.allPeepsInReverseOrder` method to use the date rather than the id. I had a slight problem with this as Datamapper's `DateTime` type only has a resolution of 1s, which was not enough for my tests to sort the peeps correctly. But because I had a unit test for the method it was easy for me to isolate and fix the problem, illustrating Alice's point that extracting complexity into the model makes it easier to change. (Is that what Alice meant?)

