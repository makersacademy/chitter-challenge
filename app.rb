require 'sinatra/base'
require 'sinatra/flash'
require_relative './model/db_processor'
require_relative './model/verification'
# main program class
class App < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do 
    DataProcessor.create(Verification, DbProcessor)
    redirect('/home')
  end

  get '/home' do
    @messages = DbProcessor.read('twats')
    erb(:index)
  end

  post '/send-message' do
    DbProcessor.write({ msg: params.values.join,
                        time: Time.now.strftime("%d/%m/%Y %H:%M") }, 'twats')
    redirect('/home')
  end

  post '/new' do
    flash[:sucess] = DataProcessor.create_account({ username: params['username'], 
                                                    password: params['password'],
                                                    email:    params['email'], 
                                                    name:     params['name'] })
    redirect('/home')
  end

  post '/login' do
    flash[:success] = DataProcessor.login(params['login_username'], 
                                          params['login_password'])
    redirect('home')
  end

  post '/logout' do

  end

  run! if app_file == $PROGRAM_NAME

end
