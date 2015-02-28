require 'sinatra/base'
require 'data_mapper'
require './lib/peep.rb'
require './lib/tag.rb'
require './lib/user.rb'
require 'rack-flash'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_challenge_#{env}")

DataMapper.finalize

DataMapper.auto_upgrade!

class Chitter < Sinatra::Base

  helpers do

    def current_user
      @current_user ||=User.get (session[:user_id]) if session[:user_id]
    end
  end

  enable :sessions
  set :super_sessions, 'super secret'
  use Rack::Flash
  
  get '/' do
    @peeps = Peep.all
    erb :index
  end

  post '/peeps' do
    message = params["message"]
    Peep.create(:message => message)
    redirect to('/')
  end

  get '/users/new' do
    @user = User.new
    erb :"users/new"
  end

  post '/users' do
    @user = User.new(:email => params["email"],
                :password => params["password"],
                :password_confirmation => params["password_confirmation"],
                :name => params["name"],
                :username => params["username"])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :"users/new"
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
