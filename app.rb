require 'bcrypt'
require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'
require_relative 'lib/user'
# require_relative 'lib/date_helper'
require 'json'


class ChitterApp < Sinatra::Base

  configure do
    enable :sessions, :method_override
    register Sinatra::Flash
  end

  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users/new' do
    encrypted_password = BCrypt::Password.create(params[:'new-password'])

    user_email = User.where(email: params[:'new-email']).first
    if user_email
      flash[:notice] = 'The supplied email address is already in use'
      redirect '/users/new'
    end

    user_grip = User.where(grip: params[:'new-grip']).first
    if user_grip
      flash[:notice] = 'The supplied grip id is already in use'
      redirect '/users/new'
    end

    user = User.create({ first_name: params[:'first-name'], 
      surname: params[:surname], 
      email: params[:'new-email'], 
      grip: params[:'new-grip'], 
      password: encrypted_password 
    })
    

    session[:user_id] = user.id
    redirect '/peeps'
  end

  get '/peeps' do
    @user = User.find(session[:user_id])
    erb :'peeps/index'
  end

end