require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/user.rb'
require_relative './lib/message.rb'
require 'rake'

class Chitter < Sinatra::Base
  set :sessions, true
  register Sinatra::Flash

  MESSAGES = { 'error1' => \
  'ERROR: Invalid email', 'logout' => 'You have successfully
  logged out', 'error2' => 'ERROR: username not available', 'error3' => \
  'ERROR: email has already been used', 'error4'\
   => 'ERROR: passwords not matching', 'error5' => \
   'ERROR: invalid credentials' }

  get '/' do
    erb :index
  end

  get '/messages' do
    messages = Message.all.map { |m| [m, User.find_by_id(m.user_id).username] }
    current_user = session[:id] ? User.find_by_id(session[:id]) : nil
    erb :messages, locals: { messages: messages, current_user: current_user }
  end

  get '/messages/new' do
    erb :new
  end

  post '/messages/new' do
    Message.create((params['user_id'] = session[:id]) && params)
    redirect '/messages'
  end

  get '/users/new' do
    erb :new_user
  end

  post '/sessions/delete' do
    flash[:message] = MESSAGES['logout']
    session.delete(:id)
    redirect '/messages'
  end

  post '/users/new' do
    id = User.create params
    if /^\d+$/ === id
      session[:id] = id
    else
      flash[:message] = MESSAGES[id]
    end
    redirect '/messages'
  end

  get '/sessions/new' do
    erb :new_session
  end

  post '/sessions/new' do
    @user = User.find_by_username params['username']
    if @user && @user.password == params['password']
      session[:id] = @user.id
    else
      flash[:message] = MESSAGES['error5']
    end
    redirect '/messages'
  end

  run! if app_file == $0
end
