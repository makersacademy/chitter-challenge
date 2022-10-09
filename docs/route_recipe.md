# Planning routes 

# 1
Page: homepage 

# Request: 
GET /
No parameters 

# Response: 200 OK 
HTML view with home page (including an about, and a link to view all tweets and a submit form for a new account)

# 2
Page: list of all chitters  

# Request: 
GET /peeps
No parameters 

# Response: 200 OK 
HTML view with details of all tweets and a link to a single tweet 

# 3 
Page: add a chitter 

# Request: 
POST /peeps/add
Parameters: message, 

# Response: 200 OK 
HTML view with submit for a new entry

# 4 
Page: viewing a single tweet (with a time)

# Request: 
GET /peeps/:id
Parameters: unique id 

# Response: 200 OK 
HTML view of a single tweet with the time it was tweeted 

# 5 
Page: submit a form to create a chitter account 

# Request: 
POST /peeps
Parameters: email, password, name, username 

# Response: 200 OK 
HTML view confirmation message of created account
