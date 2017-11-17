require 'sinatra/base'
require 'sinatra/flash'
require_relative 'models/db-setup'
require_relative 'models/user'

ENV['RACK_ENV'] ||= 'development'

class App < Sinatra::Base
  register Sinatra::Flash

  enable :sessions
  set :session_secret, 'narcissus'

  helpers do 
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/users/new' do
    erb(:'auth/signup', locals: { user: User.new })
  end

  post '/users/new' do
    user = User.new(name: params[:name], password: params[:password],
                    password_confirmation: params[:confirmation], 
                    email: params[:email], handle: params[:handle])
    if user.save
      session[:user_id] = user.id
      redirect('/peeps')
    else
      flash.now[:notice] = "Passwords do not match"
      erb(:'auth/signup', locals: { user: user })
    end
  end

  get '/peeps' do
    erb(:'/peeps/peeps')
  end

  get '/peeps/new' do
    erb(:'peeps/new')
  end
  
  post '/peeps/new' do
    Peep.create(content: params[:content], user: current_user)
    redirect('/peeps')
  end
end
