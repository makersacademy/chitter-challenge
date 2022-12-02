# ROUTES TO BE MADE

GET /
- header
- log in section (with email address and password fields, and log in button)
      - (updates to e.g., 'logged in as {username}' next to a 'log out' button once logged in)
- field with button to post a tweet (once logged in)
- display all peeps in reverse chronological order
      - re comments:
          - display number of comments e.g. '2 comments'
          - display link to 'post comment'
          - need to click on the  peep / no_of_comments / post comment   to be taken to peep page and see comments / post comment

GET /:peep_id
- displays peep and its comments (in chronoligical order)
- display a 'post comment' field and button at bottom of comments

GET /sign_up
- displays sign-up page
    - fields for sign up info (email address, password, name and a username)
    - submit button (that takes user to /signed_up)

GET /signed_up
    - success message after sign up and button to return to homepage (stay signed in?)


POST /
- post peep (can be done once logged in)

POST /sign_up  OR  /signed_up ???
- submit sign up request

POST /:peep_id
- post comment on peep (with given peep_id)