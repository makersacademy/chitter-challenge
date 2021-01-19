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
"email"
"password"
"name"
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
model->controller: "session[:user_id] = @user.id"
controller->controller: "Redirect get '/peeps'"
controller->views: "erb :'/peeps/index'"
views->controller: "peeps/index.erb"
controller->client: "show.html response"
