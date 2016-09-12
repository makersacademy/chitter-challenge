WELCOME TO CHITTER!

This is a very basic web app that allows users to post what they are doing with their lives online for others to see.

To play the app do the following

 - clone this repository
 - run 'bundle install' in the terminal
 - run 'ruby app.rb' in the terminal
 - open your browser and check localhost:4567 (or whatever port you choose)

This app is very much a twitter clone, to use it simply sign up, or log in.
You will then be able to 'peep' you thoughts for all to see.

The app meets the following requirements:

 - Makers sign up to chitter with their email, password, name and a user name (e.g. sam@makersacademy.com, s3cr3t, Samuel Russell Hampden Joseph, tansaku).
 - The username and email are unique.
 - Peeps (posts to chitter) have the name of the maker and their user handle.
 - Uses bcrypt to secure the passwords.
 - Uses data mapper and postgres to save the data.
 - You don't have to be logged in to see the peeps.
- It's only possible to peep if you are logged in.
- A README to indicate the technologies used, and give instructions on how to install and run the tests

 - Extraction of the controller to two separate controllers for 'users' and 'peeps' is still a work in progress
 - Application of CSS is still

 To run tests install the app as described above and type 'coveralls report' in your terminal.

Created by

Lawrence Dawson
(Makers Academy Student)

$ coveralls report
