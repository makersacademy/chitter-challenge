require 'sinatra/base'
require 'pg'

class Chitter < Sinatra::Base

  get '/' do
    #3. get peeps from database and post them here-
    #   maybe add a time/date to each peep

    erb(:index)
  end

  post '/peep' do
    p params['user']
    user = params['user']
    p params['peep']
    #1. Connect to database
    connection = PG.connect(dbname: "chitter")
    # find whether user is in database
    result = connection.exec("SELECT * FROM users WHERE author = '#{user}'")
    username = result.map { |user| user['author'] }
    user_id = result.map { |user| user['id'] }
    user_id = user_id[0]
    peep = params['peep']
    p user_id[0]
    if username.empty?
      p 'the user is not in the database'
    else
      p 'the user is in the database'
      p peep
      connection.exec("INSERT INTO peeps(user_id, peep) VALUES('#{user_id}', '#{peep}')")

    end
    p result
    # connection.exec("INSERT INTO peeps(author) VALUES('Noel');")
    # result = connection.exec("SELECT * FROM users")
    # p result.map { |user| user['author'] }

    #2. Query the database with Insert sql

    redirect('/')
  end

  run! if app_file == $0

end


# Add these classes to a module
