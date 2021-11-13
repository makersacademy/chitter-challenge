# frozen_string_literal: true

require 'pg'

def setup_test_database
  puts
  puts 'Setting up test database...'
  user_vals = [
    { :email => 'zimmermja@gmail.com', :password => 'password111', :fullname => 'Matt Zimmer', :username => 'Matt' },
    { :email => 'waynesworld@gmail.com', :password => 'waynestock', :fullname => 'Wayne Campbell', :username => 'Wayne' },
    { :email => 'mirthmobile@gmail.com', :password => 'woofgirl', :fullname => 'Garth Algar', :username => 'Garth' }
  ]
  peep_vals = [
    { :peep => 'I see a little silhouetto of a man', :user => '2', :time => '18:00, 13/11/2021' },
    { :peep => 'Scaramouch, Scaramouch, will you do the Fandango!', :user => '2', :time => '18:05, 13/11/2021' },
    { :peep => 'Thunderbolts and lightning, very, very frightening me', :user => '3', :time => '14:00, 14/11/2021' }
  ]

  connection = PG.connect(dbname: 'chitter_zimmja_test')
  connection.exec('TRUNCATE users; TRUNCATE peeps')
  user_vals.each do |user|
    connection.exec_params("INSERT INTO users (email, pword, fullname, username) values($1,$2,$3,$4);",
    [user[:email],user[:password],user[:fullname],user[:username]]) # Broken over two lines to ease readability
  end
  peep_vals.each do |peep|
    connection.exec_params("INSERT INTO peeps (peep, peep_user, peep_time) values($1,$2,$3);",
    [peep[:peep],peep[:user],peep[:time]]) # Broken over two lines to ease readability
  end
end
