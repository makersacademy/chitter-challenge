
```
STRAIGHT UP

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a peep
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

# Installation and use

- run `bundle` from the command line
- run `psql` from the command line (install via homebrew if you don't have it)
- type `create DATABASE chitter_test;`
- type `create DATABASE chitter_development;`
- run `rspec`

```
Finished in 0.18295 seconds (files took 0.67378 seconds to load)
4 examples, 0 failures

COVERAGE: 100.00% -- 83/83 lines in 8 files
```
- run `rackup` from the command line
- go to http://localhost:9292/chitter-home to use app
