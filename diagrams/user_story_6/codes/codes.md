#### Class Definitions\
Class "User" as user:
"id"
"email"
"password"
"name"
"user_name"
"#new()"
".create()"
".find()"
".authenticate()"

CLASS "Peep" as peep:
"id"
"message"
"date_time_stamp"
"user_id"
"#new()"
".create()"
".all()"

CLASS "DatabaseConneciton" as db:
".setup()"
".query()"


#### Table definitions
TABLE "peeps" as peeps:
PK"id"
FK"user_id"
"message"
"date_time_stamp"

TABLE "users" as users:
PK"id"
"user_name"


users - peeps: (One,Many)["1","*"]

### Sequence Diagram

alias client="Client"
alias controller="Controller (app.rb)"
alias model="Model (user.rb)"
alias views="Views"
alias db="Database (chitter)"

#### Clear Session
client->controller: "post '/sessions/destroy' request"
controller->controller: "session.clear, flash[:notice] = 'You have logged out'"
controller->controller: "Redirect get '/peeps'"
