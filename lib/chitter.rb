require 'sinatra/base'
require "sinatra/flash"
require 'sinatra/partial'
require 'shotgun'
require_relative 'user'
require_relative 'DatabaseHandler'
$DB = Database.new
class ChitterApp < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    user = User.new
    user.CreateNewUser(params[:email], params[:UserPass], params[:UserName], params[:UserHandle])

  end

  get '/sign_in' do
    erb :sign_in
  end

  post '/sign_in' do
    if $DB.verifyLogin(params[:UserEmail], params[:UserPass])
      user = User.new
      user.LogIn(params[:UserEmail])
      session.clear
      session[:user_id] = user.view_userid
      redirect ('/feed')
    else
      @error = 'Username or password was incorrect'
      redirect '/sign_in'
    end
  end

  get '/feed' do
    if current_user
      erb :feed
    else
      redirect '/unauthorized'
    end
  end

  post '/peep' do
    erb :peep
  end

  get '/unauthorized' do
    erb :unauthorized
  end

  helpers do
    def current_user
      if session[:user_id] != nil
      @current_user ||= $DB.DoesUserExist(session[:user_id])
      else
      false
      end
    end

    def date_and_time(time)
      time.strftime("%c")
    end
  end

  configure do
    enable :sessions
  end

  run! if app_file == $0
end
