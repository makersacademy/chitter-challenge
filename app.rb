require 'sinatra/base'
require 'sinatra/flash'
require_relative './model/db_processor'
require_relative './model/verification'
require_relative './model/data_processor'
# main program class
class App < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do 
    DataProcessor.create(Verification, DbProcessor)
    redirect('/home')
  end

  get '/home' do
    @user = session[:user]
    @messages = DbProcessor.read('twats')
    erb(:index)
  end

  post '/send-message' do
    if session[:user].nil?
      flash[:success] = 'must be logged in to twat'
      redirect('/home')
    end
    DbProcessor.write({ msg: params.values.join,
                        time: Time.now.strftime("%d/%m/%Y %H:%M"), 
                        username: session[:user] }, 'twats')
    redirect('/home')
  end

  post '/new' do
    flash[:success] = DataProcessor.create_account({ username: params['username'], 
                                                    password: params['password'],
                                                    email:    params['email'], 
                                                    name:     params['name'] })
    redirect('/home')
  end

  post '/login' do
    redirect('/home') if params['login_username'] == "" || params['login_password'] == ""
    flash[:success] = DataProcessor.login(params['login_username'], 
                                          params['login_password'])
    session[:user] = DataProcessor.current_user
    redirect('/home')
  end

  post '/logout' do
    flash[:success] = "Logged out"
    DataProcessor.logout
    session[:user] = DataProcessor.current_user
    redirect('/home')
  end

  run! if app_file == $PROGRAM_NAME

end
