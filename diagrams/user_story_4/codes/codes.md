#### Class Definitions
CLASS "Peep" as peep:
"id"
"message"
"date_time_stamp"
"user_id"
"user_class"
"user_name"
"#new()"
".create()"
".all()"
".db_connection()"

Class "User" as user:
"id"
"name"
"#new()"
".create()"
".instance()"
".find()"
".find_name()"
".db_connection()"


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

#### Render Sign up form
client->controller: "get '/users/new' request"
controller->views: "erb :'/users/new'"
views->controller: "new.erb"
controller->client: "new.html response"

#### Record User Sign Up Data
client->controller: "post '/users' request"
controller->model: ".create"
model->db: "INSERT INTO users tables"
db->model: "RETURN user"
model->controller: "@user"
controller->controller: "redirect 'get /users/:id"
controller->views: "erb :'/users/show'"
views->controller: "show.erb"
controller->client: "show.html response"
cleint->controller: "get '/peeps/new' request"
