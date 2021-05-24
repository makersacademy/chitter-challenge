require 'sinatra/base'
require 'sinatra/reloader'
require 'capybara'
require './lib/peep'
require './lib/user'

class Chitter < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    p session[:user_id]
    @user = User.find(id: session[:user_id])
    # p @user
    @peeps = Peep.all_peeps
    erb(:index)
  end

  get '/new-peep' do
    erb(:new_peep)
  end

  post '/post' do
    Peep.create(message: params[:message])
    redirect '/'
  end

  get '/sign-up' do
    erb(:sign_up)
  end

  post '/new-account' do
    user = User.create(
      email: params['email'], 
      name: params['name'], 
      username: params['username'], 
      password: params['password'])
    session[:user_id] = user.first['id']
    redirect '/'
  end
end
