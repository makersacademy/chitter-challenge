ENV["RACK_ENV"] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup.rb'

class Chitter < Sinatra::Base

  enable :sessions
  set :sessions_secret, 'shhh'

  get '/add_peep' do
    erb :add_peep
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  post '/peeps' do
    Peep.create(content: params[:content], creator: User.current_user(session[:current_user_id]).username)
    redirect '/peeps'
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/users' do
    user = User.create(name: params[:name],
                       username: params[:username],
                       email: params[:email],
                       password: params[:password])
    session[:current_user_id] = user.id
    redirect '/peeps'
  end

  run! if app_file == $0
end
