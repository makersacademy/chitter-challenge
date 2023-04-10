# Page: Homepage 


## Request
```
GET /
```

## If user logged in
### Response (200 OK)
> Form to create new peep (one single message field)
> 
>HTML view with all peeps in rev chronological order (w/ author names and handles)

## Else
### Response (200 OK)
>HTML view with all peeps in rev chronological order (w/ author names and handles)

## Request

### After submitting form to create peep:

```
POST /peep
Params: message
```
1. Santise user input to protect against javascript and SQL injection - swapping /escaping characters where needed 
2. Taking User ID from session object, create a new row in peeps table for peep
3. Check if message included “@“ followed by more text && if the text matches any usernames, add that user and that post to the join table, and send an automated email to each of those users
4. Redirect user to GET / where they should see their new peep

```
POST /logout
```

>If user not logged in to session
>
>302 redirect
>
>Redirect to GET /
>
>ELSE
>
>Update session objec to logged out
>
>return /confirm_logout view
  
# Page: Register

```
GET /register
```

## If user logged in
### Response (302 redirect)
redirect to GET /

## Else
### Response (200 OK)
Display HTML form to register

```
POST/ submit_register
Params: username, name, email, password
```
>If user logged in to session object already
>
>Return 302 redirect
>
>Redirect to GET /
>
>ELSE
>
>Sanitise user input
>
>Check if valid email
>
>If username or email already taken, or email invalid
>
>Display /deny_register view
>
>Display reason for denial
>
>Else, Implement password hashing
>
>Create user in database, update session object to logged in and return /confirm_register view

# Page: Login

```
GET /login
```

>If user logged in to session object already
>
>Return 302 redirect
>
>Redirect to GET /
>
>ELSE
>
>Display view with HTML form to log in 
>
>username and password fields

```
POST /login_attempt
params: username, password
```
>If user logged in to session object already
>
>Return 302 redirect
>
>Redirect to GET /
>
>ELSE
>
>Confirm if username exsits
>
>&& That password matches
>
>If either fails, return /login_denied view with reason for failure
>
>Else, update session object to logged in with correct user ID 
>
>Redirect to /

# OPTIONAL EXTRAS

# Page: All Peeps by User ID
```
GET /:user_id
```
>Display all peeps by user_id

# Page: All peeps a user is tagged in
```
GET /tagged/:user_id
```
>Display all peeps that a given user_id was tagged in
