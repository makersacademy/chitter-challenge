# Chitter Challenge

```
 ██████╗██╗  ██╗██╗████████╗████████╗███████╗██████╗ 
██╔════╝██║  ██║██║╚══██╔══╝╚══██╔══╝██╔════╝██╔══██╗
██║     ███████║██║   ██║      ██║   █████╗  ██████╔╝
██║     ██╔══██║██║   ██║      ██║   ██╔══╝  ██╔══██╗
╚██████╗██║  ██║██║   ██║      ██║   ███████╗██║  ██║
 ╚═════╝╚═╝  ╚═╝╚═╝   ╚═╝      ╚═╝   ╚══════╝╚═╝  ╚═╝

```

## Task

I have been tasked to create a twitter clone that will let people post peeps (messages) shown in reverse chronological order - you will not need an account to see these peeps. Users will be able to register for Chitter by providing their email, name, username and password where the email and username must be unique. Peeps will show the name of their maker, their username aswell as the time that the peep was created.

## Instructions

Clone this repository to your desired location using `git clone https://github.com/mcsuGH/chitter-challenge.git` then run `gem install bundler` (if you don't already have bundler), and then use the command `bundle install`.

## User Stories

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

## References
```
https://patorjk.com/software/taag/#p=display&f=ANSI%20Shadow&t=CHITTER
https://www.postgresql.org/docs/current/functions-datetime.html
https://github.com/jmondo/orderly

```
used the above for ASCII letters in banner on README\
used the above to store the current time the entry is made inside the database\
used the above gem to test reverse chronological order