# Chitter Challenge #

## My approach ##

I prepared for the challenge by reading all of the instructions and supporting material throughly.

Following this I listed all aspects to be tested to verify I have covered them all along with any other additional notes on code I will need to use and any other requirements of my program/tests.

I then began the challenge itself by reading each of the User Stories and creating a feature test, followed by controller, view and model for each.

I then re-tested my unit and feature tests to confirm the program worked as intended.

However, upon attempt to work on the one to many relationships using a user_id column to denote a foreign key that related my Peep table to the User table to which is belongs.

Had this been successful I planned to encrypt the password and further refactor.

Test coverage until this point was 100% and there were zero rubocop offenses.


## Contents ##

App folder containing:
    1. Models
        - peep.rb
        - user.rb
    2. Views
        - links
          - index.erb
          - peep_new.erb
          - signup.erb
    3. app.rb

Spec folder containing:
    1. features
         - creating_peeps_spec.rb
         - sign_up_spec.rb
         - viewing_peeps.rb
    2. spec_helper.rb

## Authors ##

Olivia Frost

This repository was forked and then cloned from makersacademy/chitter-challenge