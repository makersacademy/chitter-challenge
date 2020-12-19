#### Class Definitions
CLASS "Peep" as Customer:
"message"
".create()"
"#new()"


#### Table Definitions
TABLE "peeps" as peeps:
PK"id"
"message"

### Sequence Diagram

alias client="Client"
alias controller="app.rb"
alias model="peep.rb"
alias views="Views"
alias db="chitter Database"


client->controller: "get '/peeps/new' request"
controller->views: "erb :peeps/new"
views->controller: "new.erb"
controller->client: "new.html response"
client->controller: "post /peeps request"
controller->model: ".create(with params)"
model->db: "INSERT INTO peeps table"
db->model: "RETURN peep"
model->controller: "'post /peeps'"
controller->controller: "redirect 'get /peeps/:id'"
controller->views: "erb :show"
views->controller: "show.erb"
controller->client: "show.html response"
