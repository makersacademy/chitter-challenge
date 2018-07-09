### Chitter Challenge

# Blabber

*Tired of twitter's market dominance? Try out Blabber instead. It's the hot new place to tell your friends what's on your mind and see what's on theirs. And it's totally free of right-wing trolls (for now).*

This app allows multiple users to post and view messages in their browser. It was built over a weekend as part of the curriculum at the Makers Academy coding bootcamp.

## Getting started
Enter the following commands in your terminal:

Clone the repository:
`git clone https://github.com/heuperman/chitter-challenge.git`

Install the required gems:
`bundle`

Run the rake file to set up the required databases
`rake setup`

## Usage
Enter the following commands in your terminal:

Change into the main directory:
`cd chitter-challenge`

Run the app:
`rackup`

Then open your browser, head to http://localhost:9292/ and simply follow the instructions on the page.

## Running tests
This app comes with a full feature test and unit tests with 100% coverage (determined using the simplecov gem).

To run all available tests enter `rspec` in your terminal.

## Built with
Sinatra -- as the web application framework
PostgreSQL -- as the database mananagement system
BCRypt -- as the password encryption tool
Rspec and Capybara -- as testing frameworks

## Authors
The good people at [Makers Academy](https://makers.tech/) -- set up, Gemfile and instructions
[Cornelis Heuperman](https://github.com/heuperman) -- tests, code and flavour text
