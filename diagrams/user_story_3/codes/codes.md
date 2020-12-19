#### Class Definitions
CLASS "Peep" as peep:
"id"
"message"
"date_time_stamp"
"#new()"
".create()"
".find()"
".db_connection()"
".all()"

#### Table definitions
TABLE "peeps" as peeps:
PK"id"
"message"
"date_time_stamp"

### Sequence Diagram

alias client="Client"
alias controller="Controller (app.rb)"
alias model="Model (peep.rb)"
alias views="Views"
alias db="Database (chitter)"


client->controller: "get '/peeps' request"
controller->model: ".all"
model->db: "SELECT * FROM peeps"
db->model: "RETURN peeps"
model->controller: "@peeps"
controller->views: "erb :'/peeps/index'"
views->controller: "index.erb"
controller->client: "index.html response"
