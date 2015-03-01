require 'data_mapper'
require 'sinatra/base'
require 'rack-flash'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")

require './lib/peep'
require './lib/user'

DataMapper.finalize

DataMapper.auto_upgrade!

class ChitterChallenge < Sinatra::Base

  use Rack::Flash

  helpers do
    def current_user
      @current_user ||=User.get(session[:user_id]) if session[:user_id]
    end
  end

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  post '/peeps' do
    text = params["text"]
    Peep.create(:text => text)
    redirect to('/')
  end

  get '/users/new' do
    @user = User.new
    erb :"users/new"
  end

  post '/users' do
    @user = User.create(:email => params[:email],
                :password => params[:password],
                :password_confirmation => params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash[:notice] = "Sorry, your passwords don't match"
      erb :"users/new"
    end
  end
end
