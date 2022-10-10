Modelling and planning an application

Page: Homepage

## Request:
Get /
no parameters
## Response (200 OK)
Links: list of peeps and sign-up form
HTML view with a home page <Welcome to Chitter>

Page: List of peeps

## Request:
Get /peeps
no parameters
## Response (200 OK)
Links: Add message page
Html view with list of peeps

Page: Add a peep

## Request:
Post /peeps/add
parameters: message
## Response (200 ok)
Html view with a submit new chitt

Page: Viewing single peep(time_stamp)

## Request:
Get /peeps/:id
parameters: unique id
## Response (200k)
Html view with a single chitt with time stamp 

Page: Submit form to create a chitter account

## Request:
Post /peeps
with parameters: email, password, name and username

## Response (200k)
Html view with confirmation message
