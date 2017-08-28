ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'


class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    erb(:index)
  end

  get '/users/new' do
    erb :'users/new'
  end
  
  post '/users' do
    user = User.create(email: params[:email],
            username: params[:username],
            password: params[:password])
    session[:user_id] = user.id
    redirect to('/peeps')
  end

  get '/peeps' do
    @peeps = Peep.all
    erb(:'peeps/index')
  end

  get '/peeps/new' do
    erb(:'peeps/new')
  end

  post '/peeps' do
    Peep.create(message: params[:msg], created_at: Time.now)
    redirect '/peeps'
  end

 # .strftime("Printed on %m/%d/%Y") to format time (Nilclass error)

# start the server if ruby file executed directly
run! if app_file == $0
end
