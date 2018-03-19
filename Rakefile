if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

task :test_database_setup do
  p "Setting up test database..."
  require 'pg'
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE peeps, users;")
  connection.exec("INSERT INTO users(uid, name, email, username, password) VALUES(1, 'Ammar Arjomand','persiancookbook@gmail.com','ajibaji','123'),(2, 'Joe Blogs','joe.blogs@gmail.com','jojo','123'),(3, 'Mary Jane','idontsmoke@gmail.com','ohmyjane','123');")
  connection.exec("INSERT INTO peeps(peep, uid, created_at) VALUES ('Hello, Pyong Yang!', 1, '2018-03-18 21:46:50.129306'), ('got his first neck ripple', 2, '2018-03-18 21:46:51.129306'), ('Stay black!', 3, '2018-03-18 21:46:52.129306'), ('Hello, London!', 1, '2018-03-18 21:46:53.129306'), ('got his first saxamaphone', 2, '2018-03-18 21:46:54.129306'), ('A gonna get you hii today. Cos its Friday, you aint got no jaab n you aint got shit to do!', 3, '2018-03-18 21:46:55.129306'), ('Hello, world!', 1, '2018-03-18 21:46:56.129306'), ('got his first gi-tar', 2, '2018-03-18 21:46:57.129306'), ('Hi, Smokey!', 3, '2018-03-18 21:46:58.129306');")
end
