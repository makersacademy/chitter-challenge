

get '/' do
  return erb(:homepage)
end


Homepage:
> "Welcome to Chitter" - banner/header
> "Log in" - href to a log in form that allows a user to log into an existing account - GET
> "Sign Up" - href hyperlink to a sign up form which creates a new Maker obj and adds to DB - POST 
> "View all peeps" - GET - Displays all existing peeps from all Makers

Sign up page: 
> form with all required fields to add a new - POST
> If successful takes to a newly created "User page" 
> Failures: If username or email_address already exist within DB.

Log in page:
> Form with username and password sections - GET
> If successful takes to an existing "User page"
> Failures: If email_address or username used for log in does not exist in database
If password does not correspond with existing username/email_address
 
User page: 
> "Welcome #{user}"
> "Create a peep" - POST - adds a peep to the database related to this user/maker id
> "Delete a peep" - POST - deletes a peep from the database
> "View all previous peeps" - GET - Shows all peeps related to this user - params[id]
> "Log out" - GET - returns to homepage

All peeps page: 
> (Does not require an existing account to view all peeps)
> Displays all existing peeps in order of most latest timestamp.
> Each peep shows name of maker who created it, their username and a timestamp.
