As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

# Model

## DatabaseConnection
.setup connects to db depending on ENV
.query(query) completes SQL query

## Bottle
.show iterates and lists all bottles

# Controller
'/' shows list of messages
DatasbaseConnection.show
SELECT * FROM shore
ORDER BY timestamp

# View
li each bottle in chronological order
show username/body/time