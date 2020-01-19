task default: %w[start_server]

task :bundle do
  puts 'Installing bundle...'
  sh 'gem install bundler'
end

task :gems => [:bundle] do
  puts 'Running bundle...'
  sh 'bundle'
end

task :postgresql => [:gems] do
  puts 'Installing postgresql...'
  sh 'brew install postgresql'
end

task :database => [:postgresql] do
  puts 'Clearing and creating databases...'
  begin
    sh "dropdb 'chitter'"
    sh "createdb 'chitter'"
  rescue => e
    puts e
  end
  begin
    sh "dropdb 'chitter-test'"
    sh "createdb 'chitter-test'"
  rescue => e
    puts e
  end
end

task :development_tables => [:database] do
  puts 'Creating development tables...'
  sh %Q[psql -U #{ENV['USER']} -d chitter --command="CREATE TABLE users(id SERIAL PRIMARY KEY, username VARCHAR(60), email VARCHAR(60), password_hash VARCHAR(60), display_name VARCHAR(60));"]
  sh %Q[psql -U #{ENV['USER']} -d chitter --command="CREATE TABLE messages(id SERIAL PRIMARY KEY, text VARCHAR(160), user_id_fkey INTEGER REFERENCES users(id), timestamp TIMESTAMP);"]
  sh %Q[psql -U #{ENV['USER']} -d chitter --command="CREATE TABLE comments(id SERIAL PRIMARY KEY, text VARCHAR(160), fk_user_id INTEGER REFERENCES users(id), message_id_fkey INTEGER REFERENCES messages(id), timestamp TIMESTAMP);"]
  sh %Q[psql -U #{ENV['USER']} -d chitter --command="CREATE TABLE tags(id SERIAL PRIMARY KEY, tag VARCHAR(160));"]
  sh %Q[psql -U #{ENV['USER']} -d chitter --command="CREATE TABLE tags_messages_comments(id SERIAL PRIMARY KEY, message_id_fkey INTEGER REFERENCES messages(id), comment_id_fkey INTEGER REFERENCES comments(id));"]
end

task :test_tables => [:development_tables] do
  puts 'Creating test tables...'
  sh %Q[psql -U #{ENV['USER']} -d chitter-test --command="CREATE TABLE users(id SERIAL PRIMARY KEY, username VARCHAR(60), email VARCHAR(60), password_hash VARCHAR(60), display_name VARCHAR(60));"]
  sh %Q[psql -U #{ENV['USER']} -d chitter-test --command="CREATE TABLE messages(id SERIAL PRIMARY KEY, text VARCHAR(160), user_id_fkey INTEGER REFERENCES users(id), timestamp TIMESTAMP);"]
  sh %Q[psql -U #{ENV['USER']} -d chitter-test --command="CREATE TABLE comments(id SERIAL PRIMARY KEY, text VARCHAR(160), fk_user_id INTEGER REFERENCES users(id), message_id_fkey INTEGER REFERENCES messages(id), timestamp TIMESTAMP);"]
  sh %Q[psql -U #{ENV['USER']} -d chitter-test --command="CREATE TABLE tags(id SERIAL PRIMARY KEY, tag VARCHAR(160));"]
  sh %Q[psql -U #{ENV['USER']} -d chitter-test --command="CREATE TABLE tags_messages_comments(id SERIAL PRIMARY KEY, message_id_fkey INTEGER REFERENCES messages(id), comment_id_fkey INTEGER REFERENCES comments(id));"]
end

task :start_server => [:test_tables] do
  puts 'Starting server on localhost:9292'
  sh 'rackup'
end
