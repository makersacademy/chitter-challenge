require 'bcrypt'
require 'sinatra/activerecord'
require 'sinatra/base'
require 'sinatra/flash'
require_relative './models/user'
require_relative './models/peep'

class Chitter < Sinatra::Base

  register Sinatra::ActiveRecordExtension

  enable :sessions

  register Sinatra::Flash

    get '/login' do
      erb :login
    end

    post '/login' do
      @user = User.find_by_email(params[:email])
      if @user&.password == params[:password]
        session[:user_id] = @user.id
        redirect '/'
      else
        flash[:notice] = 'Please check your email or password.'
        redirect '/login'
      end
    end

    get '/logout' do
      session.clear
      flash[:notice] = 'You have signed out.'
      redirect '/'
    end

    run! if app_file == $0
  end

require_relative './controllers/peeps_controller'
require_relative './controllers/users_controller'
