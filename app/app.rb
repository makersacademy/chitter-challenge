ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative './data_mapper_setup'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  enable :sessions

  set :session_secret, 'super secret'


  get '/' do
    redirect to '/peeps'
  end
  get '/users/new' do
    erb :'users/new'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do

    Peep.create(peep_text: params[:peep_text])
    redirect to '/peeps'
  end

  get '/peeps' do
    @user_name = session[:user_name]
    @peeps = Peep.all
    erb :peep
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(name: params[:name], email: params[:email], password: params[:password],password_confirmation: params[:password_confirmation])

    if @user.save # #save returns true/false depending on whether the model is successfully saved to the database.
      session[:user_id] = @user.id
      session[:user_name] = @user.name
      redirect to '/peeps'
      # if it's not valid,
      # we'll render the sign up form again
    else
      flash.now[:notice] = "Password and confirmation password do not match"
      erb :'users/new'
    end


  end
end
