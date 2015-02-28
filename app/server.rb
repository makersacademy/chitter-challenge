require 'sinatra'
require 'data_mapper'
require 'rack-flash'
require './app/model/peeps'
require './app/model/user'
require_relative 'data_mapper_setup'



class ChitterApp < Sinatra::Base
  set :views, Proc.new { File.join(root, "views") }
  set :root, File.dirname(__FILE__)

  enable :sessions
  set :session_secret, 'my unique encryption key!'
  use Rack::Flash

  get '/' do
    erb :index
  end

  post '/peeps' do
    peep = params["peep"]
    Peeps.create(:peep => peep, :entry_time=> Time.now)
    redirect to('/peeps')
  end

  get'/peeps' do
    @peep = Peeps.all(:order => [entry_time.esc])
    erb :peeps
  end

  get '/user/new' do
    @user = User.new
    erb :new_user
  end

  post '/user/new' do
    @user = User.create(:email => params[:email],
              :password => params[:password],
              :password_confirmation => params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :new_user
    end
  end


  post '/user' do

  end

  helpers do
    def current_user
      @current_user ||=User.get(session[:user_id]) if session[:user_id]
    end
  end

end