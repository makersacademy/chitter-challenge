require 'sinatra/base'
require 'data_mapper'
require 'rack-flash'

class Chitter < Sinatra::Base

  env = ENV['RACK_ENV'] || 'development'

  enable :sessions

  set :views, Proc.new {File.join(root, "..", "views")}
  set :session_secret, 'secret session'


  DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

  require_relative './lib/cheet'
  require_relative './lib/user'

  DataMapper.finalize
  DataMapper.auto_upgrade!


  get '/' do
    @cheets = Cheet.all
    erb :index
  end

  post '/cheets' do
    message = params["message"]
    created_at = params["date"]
    user_id = params["user_id"]
    Cheet.create(:message => message, :created_at => created_at, :user_id => user_id)
    redirect('/')
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    user = User.create(:email => params[:email],
                      :password => params[:password],
                      :username => params[:username])
    session[:user_id] = user.id
    redirect('/')
  end

  helpers do
    def current_user
      @current_user ||=User.get(session[:user_id]) if session[:user_id]
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
