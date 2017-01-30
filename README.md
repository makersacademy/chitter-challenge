Chitter Challenge
=================


## Setup
- $ git clone
- $ bundle
- $ createdb chitter_development
- $ rake auto_migrate
- $ rspec
- $ rackup

## Issues encountered
  Issues when feature testing. Href links to routes wouldn't work with rspec. After making my tests more simple and with help from Katya I realised why.

  **_N.B Turned my tests into unit tests rather than feature tests. I need to rewrite my code and exclude feature tests from unit tests_**

  I had an issue when creating forms. I had a form that submitted to a logout page in the layout.erb file, and form that posted a peep in the main.erb page. Clicking the button that submits either form both went to log out.

  **_N.B Turns out as Irene suggested, I hadn't closed the form. Bizarre that it worked in rspec though._**



## References
I took the validation, log in and log out methods from the end of the Bookmark Manager challenge walkthrough.

## Further improvements

Use buttons for post actions and links for something else. is IMportant and could have resolved a lot of issues. click_link rather than click_button.
