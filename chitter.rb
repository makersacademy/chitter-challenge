require 'sinatra/base'
require 'sinatra/flash'
require 'uri'
require './app/models/peep'
require './app/models/user'
require './app/models/db_connection'

class Chitter < Sinatra::Base

  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    ENV['RAILS_ENV'] = 'development' if ENV['RAILS_ENV'] != 'test'
    @peeps = Peep.all
    erb :index
  end

  post '/' do
    Peep.create(message: params[:message], user: 1)
    redirect '/'
  end

  get '/login' do
    flash[:failure] = "Invalid username or password. Try again"
    erb :login
  end

  post '/loginresult' do
    @result = User.check_password(params[:username], params[:password])
    redirect '/login' if @result == nil
    redirect '/'
  end

 DatabaseConnection.setup

end
