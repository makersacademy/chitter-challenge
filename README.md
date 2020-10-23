Chitter Challenge
=================

          _..         .-"--._                _.--"-.
      _.-7  |        /       \              /_,     \
    < ` '  |       ;      O_o             _oO_      ;
      \     |       |    .'`  `'.        .'    `.    |                _
      \    :        \  L `-._   `.    .'   _.-' J  /              .'` f_
        \   '.        |  `.  \`'-._\  /_.-'7__.-'  |             ,'      \
        ;    `.      ;  | `. \                 |  ;      _.._ ,/       _|
        | ,-.  `-._,/    ;  `-'               ;    \,_.-'  .-,        __j
        ; |  `._.         ;                  ;          .-'   ) ,.--'`
        |  .-'             ;                  ;              _'  |
        ;  \     _.'   .~  |                  |              _)  ;
        \   '-'`    /    /                    \        '-._)   /
          '.           _,'          \|./|       `,_           .`
    |\.|/  `-..___..-'`           .-"' `  \\,|_. '`-..___..-'   \|./|
    ' `"-.   ||   ||                         `      || ||      ' `"-._
              ;|   ||____                        ____|| |;  `
        mx  __| ,__=,--._\ |/,_'     _\ |/  ,|/ /_.--,r_ |__
          '"|/`"'-._\\|''``           \|_/-'   ''"`/_."'\"-`
            `       `'   |\.|/                    ''     '  \|  _
                          ' `"-._                           _."-'
                  "Why don't people raid dodo's nests anymore?
                          Because their eggs stinked!"

------------------------------------------------
[ASCII Source](https://asciiart.website/index.php?art=animals/birds%20(land))

# Instructions

## To get started

- Clone the repo 
- run `bundle`

### Create database

run:
```
psql -c 'CREATE DATABASE chitter;'
psql -d chitter -f db/migrations/database_setup.sql
```

### Start local server

- run `rackup`

```
charlotte@Charlottes-MBP chitter-challenge % rackup
[2020-09-27 19:52:14] INFO  WEBrick 1.4.2
[2020-09-27 19:52:14] INFO  ruby 2.6.5 (2019-10-01) [x86_64-darwin19]
[2020-09-27 19:52:14] INFO  WEBrick::HTTPServer#start: pid=25059 port=9292
```
- Navigate to `http://localhost:9292/` in your web browser

## Sign Up

Required Information:
- Unique Username
- Unique Email
- Name
- Password

## Log In

Required Information:
- Username
- Password

## Post Message

Requirements:
- User must be logged in.

## Data Security 

### Userid

User id's are UUIDv4's that were generated using the pgcrypto postgresql extension to prevent userid enumeration. 

### Passwords
Passwords are stored within the database as bcrypt hashes using the pgcrypto postgresql extension. 

This was implemented using [this guide](https://x-team.com/blog/storing-secure-passwords-with-postgresql/).

### SQL Injection Protection

Variable interpolation was used to protect against SQL injection. This was achieved by using the pg gem.

## Data Integrity 

### Foreign Key References

The messages table contains a foreign key reference to the users table to ensure that only users that exist in the schema can be added as message authors. If a user were to delete their account, their message history would be removed as a consequence. 

## Time Accuracy 

### Message Create Times

Message create times are stored with millisecond accuracy for message sorting. This is accomplished with the timestamp with timezone type within the database, and the pg gem type mappings. Time stamps under posts are in hour & minute configuration for readability only. 


## Incomplete tasks (todo list)
- User cannot currently log out
- Sign Up & Log In display even if logged in
- Post field and button show even if not logged in
- Currently there is no CSS styling
- Pages to handle errors (e.g already logged in, email already registered etc) are not active
- Code needs to be refactored to automatically start connection to database
