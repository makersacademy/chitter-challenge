require 'sinatra/base'
require_relative './lib/peep.rb'
require 'time'
require_relative './lib/user.rb'
require 'sinatra/flash'

class ChitterApp < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

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

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    user = User.authenticate(params['email'], params['password'])
    if user
      session[:user_id] = user.id
      redirect('/')
    else
      flash[:notice] = 'Please check your email or password.'
      redirect('/sessions/new')
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    erb(:"sessions/sign_out")
  end

  run! if app_file == $0
end
