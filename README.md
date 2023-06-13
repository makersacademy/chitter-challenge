# Chitter

Chitter is a social networking platform that allows users to post and view messages called "peeps." This README file provides an overview of the Chitter program, including its features, installation instructions, and usage guidelines.

# Features

Chitter offers the following features to its users:

Posting Messages: Users can post a message, known as a "peep," to Chitter, informing others about what they are doing.
Viewing Peeps: Users can view all peeps in reverse chronological order to see what others are saying.
Timestamps: Peeps are accompanied by a timestamp, indicating the time at which they were made.
User Authentication: Users can sign up for Chitter to post messages as themselves. They can also log in to Chitter to ensure that only they can post messages on their behalf.
User Logout: Users can log out of Chitter to prevent others from posting messages on their behalf.
Technologies Used

# Chitter is built using the following technologies:

- Ruby: Chitter is implemented in the Ruby programming language.
- ERB: ERB (Embedded RuBy) is used as a templating system to embed Ruby code within HTML and CSS files.
- CSS: Cascading Style Sheets (CSS) is used to style the Chitter web application.
- RSpec: RSpec is used as a testing framework to write and execute tests for the Chitter program.

# Installation

To run Chitter locally, follow these steps:

1. Clone the repository:
```
git clone https://github.com/carolrs/chitter.git

```

2. Navigate to the project directory:
```
cd chitter
```

2. Install the dependencies:
```
bundle install

```
3. Set up the database:
```
bundle exec rake db:setup

```
4. Start the Chitter application:
```
bundle exec rackup

```

# Usage

Once Chitter is up and running, you can perform the following actions:

- Sign up: Click on the sign-up link to create a new account on Chitter. Provide the required information to complete the sign-up process.
- Log in: Use your credentials to log in to Chitter and access the features available to registered users.
- Post a Peep: After logging in, you can post a peep by entering your message in the provided input field and clicking the "Post" button.
- View Peeps: The Chitter homepage displays all the peeps in reverse chronological order. Scroll down to view more peeps.
- Log out: Click on the log-out link to log out of Chitter and secure your account.

# Deployment

https://dashboard.render.com/web/srv-cgq8l564dadce838i1gg
