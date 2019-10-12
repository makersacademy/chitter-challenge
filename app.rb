require 'sinatra/base'
require './lib/messages'
require './lib/users'
require './database_connection_setup'

class Chitter < Sinatra::Base
  enable :session

  before do
    @messages = Messages
    @users = Users
  end

  get '/' do
    @user = @users.instance
    @message = @messages.instance
    erb :index
  end

  post '/' do
    @user = Users.create('test@test.com', 'password', 'John Doe', 'J')
    @messages.create(params[:message], @user.id)
    redirect '/'
  end

  run! if app_file == $0
end
