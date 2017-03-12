ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative './models/data_mapper_setup'
require_relative './models/user'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:id])
    end
  end

  get '/peep' do
    @user = current_user
    erb :peep
  end

  get '/sign_up' do
    erb :sign_up
  end

  get '/sign_in' do
    erb :sign_in
  end

  post '/sign_up' do
    user = User.create(name: params[:name], username: params[:username],
                e_mail: params[:e_mail], password: params[:password])
    session[:id] = user.id
    redirect '/peep'
  end

  post '/sign_in' do
    p params[:username]
    user = User.first(:username => params[:username])
    p user
    session[:id] = user.id
    redirect '/peep'
  end

  post '/peep' do
    p @user = current_user
    @new_peep = params[:new_peep]
    erb :peep
  end

  run! if app_file == $0

end
