require 'sinatra/base'
require './model/maker'
require 'bcrypt'
require 'sinatra/flash'

ENV['RACK_ENV'] ||= 'development'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super secret'

  # When our Maker gets created at sign-up, their id is stored in a session. We then look for
  # the instance of our Maker class that has an id equal to the session id, i.e. we retrieve
  # the Maker that has signed up and assign it to @current_maker.
  helpers do
    def current_maker
      @current_maker ||= Maker.get(session[:maker_id])
    end
  end

  get '/' do
    erb :index
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up_confirmation' do
    maker = Maker.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    session[:maker_id] = maker.id
    redirect to('/home')
  end

  post '/home' do
    maker = Maker.authenticate(params[:email], params[:password])
    if maker
      session[:maker_id] = maker.id
      redirect to('/home')
    else
      flash.now[:errors] = 'Incorrect email or password'
      erb :index
    end
  end

  get '/home' do
    erb :home
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
