Notes:


#table definitions
TABLE "Peep" as peep:
PK "peep_id"
FK "user_id"
"content"
"timestamp"


TABLE "Feed" as feed: 
PK "feed_id"
FK "peep_id"

TABLE "User" as user:
PK "user_id"
"username"
"name"
"email"
"password"

#table relations

peep - user: (One, One)["1","1"]

# dual relations with cardinality
user - peep: (One,Many)["1","*"]
feed - peep: (One,Many)["1","*"]
