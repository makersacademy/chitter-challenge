require "./spec/database_helpers.rb"
require "pg"
require 'bcrypt'

def reset_tables
  connection = PG.connect(dbname: 'chitter')
  connection.exec("TRUNCATE peeps, users;")
end

def add_peeps_to_database
  peep_list = 
    [{peep: 'first', username: 'king_of_universe', timestamp: Time.mktime(-2280, 6, 23, 16, 20).to_i},
    {peep: "got to do the stupid festival today #CantBeAsked", username: 'sargons_bff', timestamp: Time.mktime(-550).to_i},
    {peep: "Guys i just found this totally sick temple come check it out", username: 'sargons_bff', timestamp: Time.mktime(-540).to_i},
    {peep: "@sargons_bff mine", username: 'the_golden_C', timestamp: Time.mktime(-539).to_i}]

  connection = PG.connect(dbname: 'chitter')
  
  peep_list.each { |peep| connection.exec("INSERT INTO peeps (peep, username, timestamp) VALUES ('#{peep[:peep]}', '#{peep[:username]}', '#{peep[:timestamp]}') RETURNING peep, username, timestamp;")}
end

def add_users_to_database()
  user_list = 
    [{email: "sargon_akkad@compuserve.com", password: 'Akkadia4Evar', username: 'king_of_universe', screenname: 'Sargon of Akkad'},
    {email: "nabonidus_56@aol.com", password: 'SinMoonsMarduk', username: 'sargons_bff', screenname: 'Nabonidus'}
    {email: "cyrus_2_persia@aol.com", password: 'OpulenceIOwnEverything', username: 'the_golden_C', screenname: 'Cyrus II of Persia'}
    {email: "alexander_56@yahoo.com", password: 'Akkadia4Evar', username: 'Bucephala_gonna_getcha', screenname: 'Alexander III of Macedon'}]
  i = user_list.length if i > user_list.length or i == 0

  connection = PG.connect(dbname: 'chitter')
  
  user_list.each do |user|
    encrypted_password = BCrypt::Password.create(password)
    connection.exec("INSERT INTO users (email, encrypted_password, username, screenname) VALUES ('#{user['email']}', '#{user['password']}', '#{user['username']}', '#{user['screenname']}') RETURNING email, password, username, screenname;")
  end
end


reset_tables()
add_peeps_to_database()
add_users_to_database()