Chitter Challenge
=================

* Challenge time: rest of the day and weekend, until Monday 9am
* Feel free to use google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

Challenge:
-------

As usual please start by forking this repo.

We are going to write a little Twitter clone that will allow the users to post messages to a public stream.

Features:
-------

```
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

.
├── CONTRIBUTING.md
├── Gemfile
├── Gemfile.lock
├── README.md
├── Rakefile
├── app
│   ├── app.rb
│   ├── controllers
│   │   ├── peeps.rb
│   │   ├── sessions.rb
│   │   └── users.rb
│   ├── data_mapper_setup.rb
│   ├── models
│   │   ├── peeps.rb
│   │   └── users.rb
│   ├── server.rb
│   └── views
│       ├── layout.erb
│       ├── peeps
│       │   ├── index.erb
│       │   └── new.erb
│       ├── sessions
│       │   └── new.erb
│       └── users
│           └── new.erb
├── config.ru
├── coverage
├── disabled.yml
├── docs
│   └── review.md
├── enabled.yml
└── spec
    ├── features
    │   ├── log_in_spec.rb
    │   ├── log_out_spec.rb
    │   ├── posting_peeps_spec.rb
    │   ├── sign_up_spec.rb
    │   └── user_management_spec.rb
    ├── helpers
    │   └── session.rb
    ├── models
    │   └── user_spec.rb
    ├── spec_helper.rb
    └── viewing_peeps_spec.rb

At this stage:
- I still need to add a reply class. The peep class would have a one to many relationship with it.
- I need to find a way to reverse the order of the post.
