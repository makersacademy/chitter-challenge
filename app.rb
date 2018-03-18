require 'sinatra/base'
require_relative './lib/peep.rb'
require 'time'
require_relative './lib/user.rb'

class ChitterApp < Sinatra::Base
  enable :sessions

  get '/' do
    @user = User.find(session[:user_id])
    @peeps = Peep.all
    erb(:index)
  end

  post '/new_message' do
    message = params['message']
    time = params['time']
    author = params['author']
    DatabaseConnection.query("INSERT INTO peeps (message, time, author) VALUES('#{message}', '#{time}', '#{author}')")
    redirect('/')
  end

  get '/users/new_user' do
    erb(:"users/new_user")
  end

  post '/users' do
    user = User.create(email: params['email'], user_name: params['user_name'], name: params['name'], password: params['password'])
    session[:user_id] = user.id
    redirect('/')
  end

  run! if app_file == $0
end
