# Chitter Challenge
==================
```
           .'''.''.
       ___/ (o) `, `.
      '-==`,     ;   `.
           \    :      `-.
           /    ';        `.
          /      .'         `.
          |     (      `.     `-.._
           \     \` ` `. \         `-.._
            `.   ;`-.._ `-`._.-. `-._   `-._
              `..'     `-.```.  `-._ `-.._.'
                `--..__..-`--'      `-.,'
                   `._)`/
                    /  /
                   /--(
                -./,--'`-,        Chitter
             ,^--(                     
             ,--' `-,
```

The Chitter challenge is a 'Friday Challenge' set to try and test your knowledge of 'integrating a database into a software application'.

## Description
The program should post a message (peep) to chitter, display them in reverse chronological order, display the time it was posted and allow a user to sign up to Chitter.

## Installation
You will need to install bundle.

When bundle is installed, you need to run the sql file as shown below:

```
> psql
> \i ./db/migrations/00_run_db_setup.sql
```
This will end you in the test database.

Exit psql using:
```
> \q
```

## Roadmap
A future release may include the functionality of logging in and out Chitter in order to post a peep and receiving an email if the user is tagged in a peep.

## Authors and acknowledgment
Thanks to Makers Academy for setting this challenge, and hjw for the ASCII art. Source: http://ascii.co.uk/art/robin

## License
Please ask permission from the owner of this repo.

## Project status
This project has been completed up to the basic required functionality. I have started to use a User class and table for logging in and out of Chitter and eventually to use authentication for the username and password when logging in.
