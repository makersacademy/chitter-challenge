require 'sinatra'
require 'data_mapper'
require './app/model/peeps'
require './app/model/user'


env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

  set :views, Proc.new { File.join(root, "views") }


DataMapper.finalize
DataMapper.auto_upgrade!

class ChitterApp < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :index
  end

  post '/peeps' do
    peep = params["peep"]
    Peeps.create(:peep => peep, :entry_time=> Time.now)
    redirect to('/')
  end

  get'/peeps/' do
    @peep = Peeps.all
    erb :peeps
  end

  get '/users/new' do
    @user = User.new
    erb :index
  end

  post '/users' do
    @user = User.create(:email => params[:email],
              :password => params[:password],
              :password_confirmation => params[:password_confirmation])
    # if @user.save
       session[:user_id] = @user.id
       redirect to('/')
    # else
    #   flash.now[:errors] = @user.errors.full_messages
    #   erb :index
    # end
  end

  helpers do
    def current_user
      @current_user ||=User.get(session[:user_id]) if session[:user_id]
    end
  end

end