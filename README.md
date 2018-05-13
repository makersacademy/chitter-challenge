# Chitter Challenge

A web application for submitting and sharing messages between users.

### Motivation

This project has been created as part of my journey as a junior developer at Makers Academy.

### Features

- Users can sign up using their email, password, name and username.
- Users credentials are remembered and they can sign in to the application using them.
- Once a user is signed in they can create 'peeps', 140 character messages.
- Peeps are shown along with the user who wrote them's name and handle, as well as the time of posting.
- A user will remain logged in until they log out.

### Installation

Program developed in ruby 2.5.1 using Sinatra and run with rack. The program should be downloaded and set up as follows:

```
$ git clone git@github.com:williampowell92/chitter-challenge.git
$ cd chitter-challenge
$ bundle
$ rackup
```

For the application to work correctly, you will also have to set up the necessary databases.

### How to use?

The program should be run from a client, such as Google Chrome.

Once you have navigated to the address, you can sign up as a user from the homepage. Once you have signed up you will be redirected to the main page where peeps can be seen. You can add your own peeps, these will automatically be attributed to you and a timestamp will be displayed alongside them. You can log out at any time by pressing log out.

### Tests

Unit testing was carried out using RSpec. Feature testing was carried out using Capybara. Tests can be run from the project home directory:

```
$ rspec
```

### Technologies

This website was built using Ruby, Sinatra, RSpec, Capybara, HTML and CSS
