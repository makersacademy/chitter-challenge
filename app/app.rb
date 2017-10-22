ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require 'bcrypt'
require './app/data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  get '/infrastructure' do
    'infrastructure working'
  end

  get '/peeps/new' do
    erb :'peeps/new_peep'
  end

  post '/feed' do
    Peep.create(contents: params[:peep], time: Time.now)
    redirect '/feed'
  end

  get '/feed' do
    @peeps = Peep.all.reverse
    erb :feed
  end

  get '/users/new' do
    erb :'users/new_user'
  end

  post '/users/new' do
    user = User.create(email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id if !!user
    redirect '/users/confirmation'
  end

  get '/users/confirmation' do
    erb :'users/confirmation'
  end

  # post '/login' do
  #   user = User.first(email: params[:email])
  #   if !!user
  #      if check_user_details(user, params[:password])
  #        session[:user_id] = user.id
  #        redirect '/users/confirmation'
  #      end
  #   else
  #     redirect '/users/failed_login'
  #   end
  # end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end

    # def check_user_details(user, password)
    #   user.password_digest == BCrypt::Password.create(password)
    # end
  end
end
