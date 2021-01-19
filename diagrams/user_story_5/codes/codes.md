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

#### Render Log In Form
client->controller: "get '/sessions/new' request"
controller->views: "erb :'/sessions/new'"
views->controller: "sessions/new.erb"
controller->client: "new.html response"

#### Authenticate User Log In Data
client->controller: "post '/sessions' request"
controller->model: ".authenticate"
model->db: "SELECT * FROM users WHERE email = params[:email]"
db->model: "RETURN user"

#### If user
model->controller: "session[:user_id] = @user.id"
controller->controller: "Redirect get '/peeps'"

#### if not user
controller->views: "erb :'/sessions/new', with flash[:notice]"
views->controller: "sessions/new.erb"
controller->client: "new.html response"
