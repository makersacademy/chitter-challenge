# Chitter Challenge
## Overview
The challenge is a courtesy of Makers.
Test Coverage: 100%

__Things I could have done better:__
I spent too much time trying to make Active Record work without the rails. The documentation online is vastly different one from another and, most of the times, outdated. I wish I hadn't spend that much time on it, just to see myself fail. As a result, I didn't have much of the time and energy to complete more of the complicated features for the challenge.

## Features

```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter
```

```
As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order
```

```
As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

## Installation
* clone the repository to your local machine
* `cd chitter-challenge`
* `bundle`
* `CREATE DATABASE chitter_development;`
* `\c chitter_development;`
* `CREATE TABLE chitters ( id SERIAL PRIMARY KEY, message VARCHAR(250), timestamp TIMESTAMP DEFAULT VALUE NOW();)`
* `CREATE DATABASE chitter_test;`
* `\c chitter_test;`
* `CREATE TABLE chitters ( id SERIAL PRIMARY KEY, message VARCHAR(250), timestamp TIMESTAMP DEFAULT VALUE NOW() );`
* `rackup` to see the website
* `rspec` to run the tests

