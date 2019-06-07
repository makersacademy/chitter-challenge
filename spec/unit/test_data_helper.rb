require "db_connection"

def connect_delete_and_create_data
  DbConnection.query("TRUNCATE peeps, users RESTART IDENTITY CASCADE;")
  User.create("SuperMario", "myuser@makers.com", "111")
  User.create("Louigi", "theotherone@makers.com", "222")
  User.create("Tortoise", "Emma@me.com", "pass123")
  Peep.create("My first peep", 1)
  Peep.create("I have just added this", 2)
end

def register
  visit("/")
  click_button "Register"
  fill_in("user", with: "user@me.com")
  fill_in("pass", with: "pass123")
  fill_in("name", with: "Rocky")
  click_button "Sign Me Up"
end

def post_a_peep
  visit("/")
  click_button("Add new Peep")
  fill_in "peep", with: "Today is the best day!"
  click_button("Peep")
end
