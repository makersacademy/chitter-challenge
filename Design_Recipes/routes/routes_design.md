# Page: list of peeps (home page)

## Request:
GET /
No Parameters

## Response (200 OK)
HTML list of peeps


# Page: new post page

## Request:
GET /new
No Parameters

## Response (200 OK)
HTML view with form to add title and content of peep, submit button


# Page: new post confirmation page

## Request:
POST /new
With parameters:
    title = "..."
    content = "..."

## Response (200 OK)
HTML view with confirmation message


# Page: Login page

## Request:
GET /login
No Parameters

## Response (200 OK)
HTML view with form for username and password, submit button.

# Page: login successful page

## Resquest:
POST /login
with parameters:
    username
    password

## Response (200 OK)
HTML view with confirmation


# Page: Sign-up page

## Request:
GET /signup
No parameters

## Response (200 OK)
HTML view with from for email, username, name, password. submit button. if successful take user back to home page, if unsuccessful, tell user why and let them try again


# Page: sign-up confirmation page

## Request:
POST /signup
with parameters:
    email
    username
    name
    password