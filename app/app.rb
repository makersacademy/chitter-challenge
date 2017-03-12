ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative './models/data_mapper_setup'
require_relative './models/user'
require_relative './models/peep'

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
    @peeps = Peep.all
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
    user = User.first(:username => params[:username])
    session[:id] = user.id
    redirect '/peep'
  end

  get '/sign_out' do
    session[:id] = nil
    @user = nil
    @peeps = Peep.all
    erb :peep
  end

  post '/peep' do
    @user = current_user
    new_peep = Peep.create(name: params[:new_peep], time: Time.now)
    @user.peeps << new_peep
    @user.save
    redirect '/peep'
  end

  run! if app_file == $0

end
