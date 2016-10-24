# Chitter Challenge

### Installation

#### Local Server:
1. Clone the directory to your machine
2. Run the server using ```ruby app/app.rb```
3. Open the browser and visit ```localhost:4567/```
4. Enjoy playing with Chitter

#### Online(via heroku):
1. Visit ```insert valid website address here```
2. Enjoy playing with Chitter


### How to use

* Firstly, sign up (name, email and password are required)
* Sign in using your new username and password
* Leave messages on Chitter
* Sign out after you are done

## User Stories

```
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter
```
#### Solution

* Create a database for chitter_development and chitter_test
* Write tests to check the creation of the databases
* Create a User class which contains the relevant sign up information (name, username, email, password and password confirmation)
* Create a web view which contains a form which can be filled out to fulfil the user criteria
* Modify the controllers to be able to obtain the user input and pass it to the database
* Test to ensure the information has indeed been passed to the database and stored
* Eliminate edge cases (e.g. No email given, not unique etc...)


```
As a Maker
So that I can post messages on Chitter as me
I want to log in to Chitter
```
#### Solution

* Created a new view ```/log_in``` which has email and password fields
* Checks the database for the relevant information and either allows the user to log in or retry if the information doesn't exist in the database
* Tested to ensure it is working as expected

```
As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter
```
#### Solution

* Amended the layout to contain a ```log out``` button if a user is logged in
* If the log out button is pushed the session is deleted and a ```Farewell!``` notice is displayed
* Tested to ensure it is working as expected

```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter
```
#### Solution

* Created two new views ```/peeps``` and ```/new_peep```
* ```/peeps``` is the base peeps view which shows all the peeps made
* ```/new_peep``` is a new view on which a new peep can be created
* Once the new peep is created it is logged on the ```/peeps``` page and output the user who created it, what they peeped and a time. Sadly, the time at this point is the time you loaded the page and not specific to the peep. That is a later user story though.
* Tested to ensure it is working as expected

```
As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order
```
#### Solution

* Created a sort class array block
* Sorts from newest to oldest using ```peep.id```
* Tested to ensure it is working as expected

```
As a maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```
#### Solution

* Added ```:time``` as a property to the Peep class
* Before saving the peep in the ```get '/peep'``` controller it creates and instance of ```Time.new``` and saves that in the database alongside the peep
* Tested to ensure it is working as expected

## Future intentions
