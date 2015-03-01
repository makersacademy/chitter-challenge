require 'data_mapper'
require 'sinatra/base'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")

require './lib/peep'
require './lib/user'

DataMapper.finalize

DataMapper.auto_upgrade!

class ChitterChallenge < Sinatra::Base

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
    erb :"users/new"
  end

  post '/users' do
    user = User.create(:email => params[:email],
                :password => params[:password])
    session[:user_id] = user.id
    redirect to('/')
  end
end
