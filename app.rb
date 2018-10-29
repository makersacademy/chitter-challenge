require 'sinatra/base'
require './lib/message'
require './lib/user'
require 'pg'

class Chitter < Sinatra::Base

  before do
    @user = User.instance
    @message = Message.instance
  end

  get '/' do
    ENV['ENVIRONMENT'] == 'test' ? (connection = PG.connect(dbname: 'chitterdb_test')) : (connection = PG.connect(dbname: 'chitterdb'))
    
    result = connection.exec("SELECT * FROM messages ORDER BY message_date DESC, message_time DESC LIMIT 10;")
    @messages = result.map { |message|
      { date: message['message_date'], time: message['message_time'], text: message['message_text'], handle: message['author_handle'], name: message['user_name'] } }
    erb :index
  end

  get '/log_in' do
    erb :log_in
  end

  post '/create_user' do
    @user = User.create(params[:user_handle], params[:user_password])
    @user.name != nil ? (redirect '/account') : (redirect '/log_in')
  end

  post '/new_user' do
    ENV['ENVIRONMENT'] == 'test' ? (connection = PG.connect(dbname: 'chitterdb_test')) : (connection = PG.connect(dbname: 'chitterdb'))
    connection.exec("INSERT INTO users (user_handle, user_name, user_email, user_password) VALUES('#{params[:new_user_handle]}', '#{params[:new_user_name]}', '#{params[:new_user_email]}', '#{params[:new_user_password]}');")
    redirect '/success'
  end

  get '/success' do
    erb :success
  end

  get '/account' do
    @user_name = @user.name
    @user_handle = @user.handle

    ENV['ENVIRONMENT'] == 'test' ? (connection = PG.connect(dbname: 'chitterdb_test')) : (connection = PG.connect(dbname: 'chitterdb'))
    
    result = connection.exec("SELECT * FROM messages ORDER BY message_date DESC, message_time DESC LIMIT 10;")
    @messages = result.map { |message|
      { date: message['message_date'], time: message['message_time'], text: message['message_text'], handle: message['author_handle'], name: message['user_name'] } }
    erb :account
  end

  post '/message_send' do
    @message = Message.create(params[:message], @user.handle, @user.name)
    ENV['ENVIRONMENT'] == 'test' ? (connection = PG.connect(dbname: 'chitterdb_test')) : (connection = PG.connect(dbname: 'chitterdb'))

    connection.exec("INSERT INTO messages (message_text, author_handle, user_name) VALUES ('#{@message.text}', '#{@message.user_handle}', '#{@message.user_name}');")
    
    redirect '/account'
  end

end
