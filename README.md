# chitter-challenge

This repo conatins all files nesceserry to build, run or devellop my application Twatter.

## Installation

### Getting started

in order to run the tests or the program you must first ensure that postresl is installed. then run the following commands in cmd/ terminal to create the main database for this project:
```
        Jacks-MacBook-Pro:Week 4 jackbranch$ psql
        jackbranch=# CREATE DATABASE chittertest;
        You are now connected to database "chittertest" as user "jackbranch".
```

you will now need to create the following tables:

    - twats:
    --------------------------------------------------------------------------------------
    | id(serial primary key)|message(varchar(500)|send_time(var_char(40))|user_id(int4)
    |_______________________|____________________|_______________________|________________

    - users:
    --------------------------------------------------------------------------------------
    | id(serial primary key)|username(varchar(40))|password(var_char(30)) |email(varchar                                                                                  (40)))
     -----------------------
    | name(varchar(30)     |

    if done correctly, the program or tests may now be excecuted. no data is required inside the tables for the program to function.

## Running the tests

in order to run the tests rspec must be installed, do this by running bundle in terminal/ cmd. depending on your ruby version/ os you should get either 57 or 58 tests out of 58 passing. this is a bug, i get 58 on one system and 57 on another. if this happens to you try uncommenting the test above and commenting the active expect (found in feature_2_twats_order_spec ln 9/10)

## Usage

Upon running the application you will be greeted with the home screen. from here you will be prompted to create an account and must do so in order to post a message. from here all messages sent sill display on the home screen in reverse chronological order.

**note** currently there is only one environment, so upon runnning rspec **all** database records will be truncated. It is my intention to impliment a switch to toggle testing / runtime environments but it is highly buggy and or low priority currently.

## Credits

    - Makers academy: origonal program idea
    - twitter: inspiration for application