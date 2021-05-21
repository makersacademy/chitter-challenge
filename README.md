BecaLParker's Solution to Chitter Challenge: ![Quackie](https://slack-imgs.com/?c=1&o1=gu&url=https%3A%2F%2Femoji.slack-edge.com%2FT03ALA7H4%2Frubberducking%2F1e5dc51b1afe3651.png)

:speech_balloon: QUACKIE'S DUCKBOARD :speech_balloon: 
============================================================================


What does this code do?
-----------------------
In honour of Quackie (the Makers' Academy rubberducky debugger), I've made a small Twitter clone that will allow users (**Quackers**) to post messages (**Quacks**) to a public stream (**the Duckboard**).

Here are the [Class Responsibility Cards](https://docs.google.com/spreadsheets/d/11LzZXDbAgK_YshhwBttdjJfsn3WNQv_rbeffG_7G9rg/edit?usp=sharing) I made to plan this build.

>Next steps:  
>Currently, users can post **quacks** as a **guest quacker** (i.e. entering a display name and message content).  
>I plan to implement more detailed login/logout functionality (requiring username/password etc.) in a later phase of the build.

Credits
-------
I referred to the [code review rubric](https://github.com/makersacademy/chitter-challenge/blob/master/docs/review.md) for this challenge during my build.   
I discussed Spearation of Concerns with a non-Rubyist Dev [@allymparker](https://github.com/allymparker) to decide if it was OK for the SQL query to handle the 'reverse chronological order' part of the [user stories](https://github.com/BecaLParker/chitter-challenge#features), or if that should be a responsibility of the view layer.

Technologies used
-----------------
Integrated database using the `PG` gem and `SQL` queries.

How to install and run the tests
--------------------------------
|| PLACEHOLDER ||

$ git clone https://github.com/BecaLParker/chitter-challenge

$ bundle

> #Something about creating the test and live databases

$ rspec

To interact as a user:
$ rackup, visit localhost:9292 and follow any onscreen instructions.


screenshots of how the app works, or perhaps even a link to the deployed version on heroku?



Features
-------
User story | MVC model | Screenshot
--- | ---------------------------------------------------- | --- | 
As a Maker, so that I can see what others are saying, I want to see all quacks in reverse chronological order | ![see all messages MVC](./see_all_quacks_MVC.svg) |![screenshot '/']()
As a Maker, so that I can post messages on Duckboard as me, I want to submit my display name| ![user has a display name MVC](./has_display_name_MVC.svg)|![screenshot '/']()
As a Maker, so that I can let people know what I am doing, I want to post a quack on Duckboard | ![post a message MVC](./post_a_quack_MVC.svg)|![screenshot '/compose_quack']()
As a Maker, so that I can better appreciate the context of a quack, I want to see the time at which it was made |See above| See above



