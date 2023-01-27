# ROUTES TO BE MADE

GET /
- header
- log in and sign up buttons (takes user to respective pages)
      - (updates to e.g., 'logged in as {username}' next to a 'log out' button once logged in)
- field with button to post a peep (once logged in)
- display all peeps in reverse chronological order
      - re comments:
          - have 'view comments' with a link to peep and its comments (if time: display number of comments e.g. '2 comments')

GET /:peep_id
- displays peep and its comments (in chronological order)
- display a 'post comment' field and button at bottom of comments

GET /login
- displays login page
    - fields for email address and password
    - submit button

GET /sign_up
- displays sign-up page
    - fields for sign up info (email address, password, name and a username)
    - submit button

GET /signed_up
    - stay logged in and return to homepage

POST /
- post peep (can only be done once logged in)

POST /sign_up
- submit sign up request

POST /:peep_id
- post comment on peep (with given peep_id)