## Creating entity relationship diagrams

https://playground.diagram.codes/d/entity-relationship

#table definitions
TABLE "Country" as country:
PK"country_id"
"name"
"latitude"
"longitude"
"code"

TABLE "Person" as person:
PK"person_id"
FK"company_id"
FK"country_id"
"dni"
"address"
"firstname"
"secondname"
"lastname"
"birthday"

TABLE "Company" as company: 
PK"company_id"
"nit"
"name"
"address"
"type"
"location"

TABLE "Product" as product:
PK"product_id"
FK"product_type"
"product_name"
"available"

TABLE "Product Categories" as prodCategories:
PK"product_id"
FK"product_type"
"product_name"
"available"

TABLE "Supplier" as supplier:
PK"company_supplier_id"
"name"
"address"
"type"
"location"


#table relations

# a simple one to one relation
person - country

# dual relations
person - company: (ZeroOrMany,ZeroOrOne)

# dual relations with cardinality
supplier - product: (One,One)["1","1"]
company - product: (One,Many)["1","*"]
product - prodCategories: (One,OneOrMany)["1","1.."]