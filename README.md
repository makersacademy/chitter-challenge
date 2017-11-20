# Chitter

[Task](#task) | [Approach](#approach) | [Execution](#execution) | [Struggles](#struggles) | [Demo](#demo) | [Technologies](#technologies)

## <a name="task">Task</a>

This task was completed as the weekend challenge for week 4 at Makers Academy. This week saw an introduction to Relational Databases (RD), Structured Query Languages (SQL) and Object Relational Mappers (ORM) in the form of postgreSQL and DataMapper. Our challenge was to use this knowledge to test drive the creation of a Twitter clone that will allow users to log in and post to a public stream.

User stories:

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


## <a name="approach">Approach</a>

#### Relational Databases

I am really enjoying working with RDs, having had little exposure to them prior to the course. Therefore I wanted to use this challenge to fully cement my understanding of how they operate. All the way from the commands required in postgreSQL to initially set up a database and check the contents of tables, through to the use of DataMapper as an ORM and it's implementation at the model level.

#### Password Encryption

This also provided me with an opportunity to understand and implement password encryption upon sign up. Using the BCrypt gem along with DataMapper I was able to store passwords securely in the database.


## <a name="execution">Execution</a>

I have endeavoured to follow *Dont Repeat Yourself*, **DRY** and *Single Responsibility Principal*, **SRP**  at all times, extracting functions into private methods and using guard clauses where applicable. Edge cases have been accounted for through rigorous testing using doubles and method stubs in both unit and feature tests. Test classes are all run in isolation.

Feature testing of the pages is achieved through the use of Capybara and Selenium WebDriver.

## <a name="struggles">Struggles</a>

* Not yet implemented the ability to log out of Chitter
* It is currently possible to register more than once with the same email address
* Creating a style format that is use friendly
* Efficiently using RESTful URLs

## <a name="demo">Demo</a>

In order to run Chitter locally and execute tests it requires that the postgreSQL databases are set up on your machine. To do this follow the steps below:

* Clone this repo
* Change into the required directory and run `bundle install`.
* Now do the following (note - you may need to set up your psql beforehand):

```
➜  chitter-challenge git:(master) ✗ psql
psql (9.5.9)
Type "help" for help.

lewis=> \l
                                           List of databases
             Name             |  Owner   | Encoding |   Collate   |    Ctype    |   Access privileges

------------------------------+----------+----------+-------------+-------------+-----------------------
 Default                      | postgres | UTF8     | en_GB.UTF-8 | en_GB.UTF-8 |
 blog                         | lewis    | UTF8     | en_GB.UTF-8 | en_GB.UTF-8 |
 bookmark_manager_development | lewis    | UTF8     | en_GB.UTF-8 | en_GB.UTF-8 |
 bookmark_manager_test        | lewis    | UTF8     | en_GB.UTF-8 | en_GB.UTF-8 |

lewis=> CREATE DATABASE chitter_test
CREATE DATABASE

lewis=> CREATE DATABASE chitter_development

lewis=> \l
                                           List of databases

             Name             |  Owner   | Encoding |   Collate   |    Ctype    |   Access privileges
------------------------------+----------+----------+-------------+-------------+-----------------------
 Default                      | postgres | UTF8     | en_GB.UTF-8 | en_GB.UTF-8 |
 blog                         | lewis    | UTF8     | en_GB.UTF-8 | en_GB.UTF-8 |
 bookmark_manager_development | lewis    | UTF8     | en_GB.UTF-8 | en_GB.UTF-8 |
 bookmark_manager_test        | lewis    | UTF8     | en_GB.UTF-8 | en_GB.UTF-8 |
 chitter_development          | lewis    | UTF8     | en_GB.UTF-8 | en_GB.UTF-8 |
 chitter_test                 | lewis    | UTF8     | en_GB.UTF-8 | en_GB.UTF-8 |

```

 You can then run `rackup` to start the local server and Following this navigate to your browser of choice and enter your the port on which you are hosting. If this doesn't work you may need to run `rake db:auto_migrate` in the terminal to generate your User and Post tables.

<div width="600px">
	<a>
		<img src="" width="600px" height="420px" />
	</a>
</div>


# <a name="technologies">Technologies</a>

Development was entirely test driven using Ruby 2.4.0 and RSpec testing framework. Capybara and Selenium-WebDriver were used to automate browser feature tests. Rubocop was used to ensure standardised code formatting. The Sinatra web framework along with ERB was used to develop the web application and it was deployed to the web using Heroku. Databases are generated and managed using postgreSQL and maintained via Ruby using the ORM DataMapper. Password encryption is achieved through the use of the BCrypt gem.
