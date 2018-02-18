require 'sinatra/base'
require 'pg'
####################################
# PREPARING QUERIES
####################################
# conn is your connection object
# conn.prepare('givethisqueryaname', "INSERT INTO table field1,field2 VALUES ($1,$2)")
# conn.exec_prepared('givethisqueryaname',[f1_val, f2_val])
class Chitter < Sinatra::Base

  get '/' do
    #3. get peeps from database and post them here-
    #   maybe add a time/date to each peep

    erb(:index)
  end

  post '/peep' do
    # Check we have user input variables
    p 'User name:'
    p params['user']
    p 'User peep:'
    p params['peep']

    # Assign user input to variables
    user = params['user']
    peep = params['peep']

    #1. Create database connection variable
    connection = PG.connect(dbname: "chitter")

    # find whether user is in database with a prepared statement
    connection.prepare('user in user table', "SELECT * FROM users WHERE author = ($1)")
    result = connection.exec_prepared('user in user table',[user])
    p 'Returned value '
    p result

    # result = connection.exec("SELECT * FROM users WHERE author = '#{user}'")
    author = result.map { |user| user['author'] }
    user_id = result.map { |user| user['id'] }


    # Extract username and user_id from array
    username = author[0]
    p 'username---------------------------'
    p username
    p 'user_id----------------------------'
    p user_id
    user_id = user_id[0]


    if author.empty?
      connection.prepare('insert user into user table', "INSERT INTO users(author) VALUES ($1)")
      connection.exec_prepared('insert user into user table',[user])
      # Find new author id
      connection.prepare('retreive user id for new user', "SELECT * FROM users where author = ($1)")
      result = connection.exec_prepared('retreive user id for new user',[user])
      p result
      user_id = result.map { |user| user['id'] }
      p user_id
      user_id = user_id[0]
      connection.prepare('insert peep into peep table', "INSERT INTO peeps(user_id, peep) VALUES ($1, $2)")
      p peep
      connection.exec_prepared('insert peep into peep table',[user_id, peep])
    end

    # conn.prepare('givethisqueryaname', "INSERT INTO table field1,field2 VALUES ($1,$2)")
    # conn.exec_prepared('givethisqueryaname',[f1_val, f2_val])


    #   connection.exec("INSERT INTO users(author) VALUES('#{user}');")
    #   result = connection.exec("SELECT * FROM users WHERE author = '#{user}'")
    #   user_id = result.map { |user| user['id'] }
    #   user_id = user_id[0]
    #   connection.exec("INSERT INTO peeps(user_id, peep) VALUES('#{user_id}', '#{peep}')")
    # else
    #   p 'the user is in the database'
    #   connection.exec("INSERT INTO peeps(user_id, peep) VALUES('#{user_id}', '#{peep}')")
    # end
    # p result
    # connection.exec("INSERT INTO peeps(author) VALUES('Noel');")
    # result = connection.exec("SELECT * FROM users")
    # p result.map { |user| user['author'] }

    #2. Query the database with Insert sql

    redirect('/')
  end

  run! if app_file == $0

end


# Add these classes to a module
