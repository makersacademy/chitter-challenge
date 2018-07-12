<h1 align="center">Chitter Challenge</h1>

<div align="center">
  :steam_locomotive::train::train::train::train::train:
</div>
<div align="center">
  <strong>Weekend challenge</strong>
</div>
<div align="center">
  "Creating a twitter clone over the weekend"
</div>

<br />

<div align="center">

[User Stories ](#user-stories)  |
[Technology ](#technology) |
[Installation ](#installation) |
[How-To ](#how-to) |
[Testing ](#testing)

</div>

## Contents:

## User Stories:
-------

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
## Technology Used
- Ruby
- Sinatra
- Bootstrap
- Javascript

## Models

## Installation

- Install Ruby
- Git Clone the repo into its own folder
- From inside the repo folder, run 'bundle install'
- run 'rake'
- run 'rackup config.ru'
- now run 'ruby app.rb'

## Usage example

### Signup Page

![chitter signup](https://raw.githubusercontent.com/AlfieDarko/chitter-challenge/master/readme_images/Screen%20Shot%202018-06-02%20at%2016.53.00.png)

Users must sign up with their email address, passwords, username and full name.
### Login Page

![login form](https://raw.githubusercontent.com/AlfieDarko/chitter-challenge/master/readme_images/Screen%20Shot%202018-06-02%20at%2016.53.29.png)

After a user has registered successfully, he will be rerouted to a longin page where they can login using their new details.<br><br>
### Home Page

![homepage](https://raw.githubusercontent.com/AlfieDarko/chitter-challenge/master/readme_images/Screen%20Shot%202018-06-02%20at%2018.58.09.png)<br>
On this page, the user can leave peeps on the public timeline.

## Testing

- run 'rspec' in the folder

## Thoughts
I found this project quite interesting. It was a a good challenge to build a bare basics CRUD application in a new tech stack (Sinatra).<br> I really enjoyed putting together the backend but the most enjoyable part for me was styling the page. I used bootstrap as a styling framework as I had limited time (Just 2 days) and wanted to get something decent looking so I could present it to my cohort on review day. <br><br>
This challenge has really helped me have an idea of how social media sites are put together.
## TODO
If I had more time, I would have Implemented
- Ability to mention different users
- User notifications
- Fix bug where certain characters are not parsed properly into the database

All in all for 2 days work I was pretty happy with what I came up with.
## Meta

Alfie Darko - me@alfiedarko.co.uk

Distributed under the MIT license.

https://github.com/AlfieDarko/chitter-challenge

## Contributing

1. Fork it (<https://github.com/AlfieDarko/chitter-challenge/fork>)
2. Create your feature branch (`git checkout -b feature/fooBar`)
3. Commit your changes (`git commit -am 'Add some fooBar'`)
4. Push to the branch (`git push origin feature/fooBar`)
5. Create a new Pull Request
