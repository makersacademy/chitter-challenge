ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  get '/' do
    erb :home
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users/new' do #Is new_user_sign_up too verbose?
    name = params[:name]
    username = params[:username]
    password = params[:password]
    password_confirmation = params[:password_confirmation]
    email =params[:email]

    new_user = User.new(name: name,
                        username: username,
                        password: password,
                        password_confirmation: password_confirmation,
                        email: email)

    if new_user.valid?
      new_user.save
      redirect('/cheeps/index')
    else
      redirect('/')
    end

  end

  get '/cheeps/index' do
    erb :'cheeps/index'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions/new' do

    email = params[:email]
    password = params[:password]
    user = User.authenticate(email,password)
    if user
      session[:user_id] = user.id
      require 'pry'; binding.pry
      redirect '/cheeps/index'
    else
      flash.now[:errors]=['The email or password is incorrect']
      require 'pry'; binding.pry

      erb :'sessions/new'

    end
  end


end
