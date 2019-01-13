# Chitter Challenge #

## Screen shot ##

![welcome](https://user-images.githubusercontent.com/43742795/51091856-5d4f9b00-1788-11e9-81dd-e76cf129fa44.png)

![profile](https://user-images.githubusercontent.com/43742795/51091888-d51dc580-1788-11e9-991d-1e17c8fa8ba9.png)

## Project ##

The project is to build a small Twitter clone that will allow the users to post messages to a public stream, based on the following user stories.<br/>.

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
```
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter
```
```
As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter
```
```
As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter
```
```
As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```
## How to use ##

## Approach ##

I built my CRC Model based on the user story as following.<br/>

![CRC model](https://user-images.githubusercontent.com/43742795/51088801-354a4280-175c-11e9-9789-8f8c99791909.png)

I decided to prioritise my Minimum Viable Product by building my MVP as following :<br/>

1. User is able to sign_up.
2. User is able to sign_out.
3. User is able to sign_in.
4. Once signed in, user is able to post peeps.
5. All the peeps are displayed with a timestamp, a username who have created it and in reverse chronological order.
6. All the peeps are displayed on the user profile page.
7. All the peeps are also displayed on the homepage without the needs to be logged in.

### Set up ###

1. clone the repo<br/>
Under the repo name click *clone or download*<br/>
Click on *use HTTPs*, copy the clone URL of the repo<br/>
In the terminal go on the working directory where you want to clone the project<br/>
Use the `git clone` command and paste the clone URL then press enter :

```shell
$ git clone https://github.com/your-username/your-repositary.git
```

2. On your local machine go inside of the *chitter_challenge* directory :

```shell
$ cd chitter_challenge
```
3. To install all the *gems* contained in the *Gemfile*, install and run *Bundle* :
Install :

```shell
$ install bundle
```
Run:

```shell
$ bundle
```
4. You can see the different directories, with the `ls` command.

### Database ###

5. If you do not have it already, install *psql* on your local machine. Connect to your database and create two of them to be able to run the test and the app, using the `CREATE DATABASE databasename;` command.<br/>
Make one called *chitter_development* and one called *chitter_test*.<br/>

```shell
$ psql
admin= CREATE DATABASE chitter_development;
admin= CREATE DATABASE chitter_test;
```

6. Exit from psql and from the command line run the `rake` command followed by the `db:auto_migrate` command. This will create your tables in your development DB.<br/>

```shell
$ rake db:auto_migrate
```

7. From the command line run the `rake` command followed by the `db:auto_migrate RACK_ENV=test` command. This will create your tables in your test DB.<br/>

```shell
$ rake db:auto_migrate RACK_ENV=test
```

8. Connect to psql and connect to your database using the `\c databasename;` command.<br/>
Once you are connected to the database you've chosen, you can list the tables using the `\dt` command.<br/>

```shell
$ psql
admin= \c chitter_development;
chitter_development= \dt
```
9. You can connect to a specific table by using the `SELECT * FROM tablename;` command.<br/>

```shell
chitter_development= SELECT * FROM tablename;
```
### Run the tests ###

1. Check that the codes are passing the test. From the root *chitter_challenge* directory, run the *spec*.<br/>
You can check all the files in one go:

```shell
$ cd chitter_challenge
$ rspec
```
To check only one file at a time :

```shell
$ cd chitter_challenge
$ rspec spec/file_name_spec.rb
```

2. Check that the code respects the quality of the *Rubocop* guideline, by running `rubocop` from the *chitter_challenge* directory :

```shell
$ cd chitter_challenge
$ rubocop
```

## Run the app ##

1. On the command line, from the root directory *chitter_challenge*, use the `rackup` command :

```shell
$ cd chitter_challenge
$ rackup
```

You'll be able to see that the localhost port used is *9292*

1. Open your browser and type the url of your *localhost:9292*  <br/>

2. click on sign up, enter your email address, name, user name and password and click on `Sign up`.<br/>

3. Now type your peep and click on Post.<br/>
You can see your peep displayed with the time and your username.

4. Log out, and you will be bale to see your peeps displayed on the home page.<br/>
If you sign up and create new peeps from new users account, all the peeps will be displayed on the user profile page but also on the home page without being logged in.

5. Enjoy playing around with my app as much as you want :)

## Technology used ##

* Sinatra
* postgresql
* datamapper
* Capybara

## Acknowledgements ##

Code from a group project I have work on : *madcoders_makersbnb* app
