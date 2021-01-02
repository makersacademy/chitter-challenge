ENV['ENVIRONMENT'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require './app/models/message'
require './app/models/user'
require './app/models/tag'
require './app/models/mail'
require './db_setup'
require './lib/seeds'
require 'mail'


class Chitter < Sinatra::Base
  enable :sessions, :method_override
  set :session_secret, 'super secret'
  register Sinatra::Flash

  get '/' do
    erb :login, :layout => :layout
  end

  get '/signup' do
    erb :signup, :layout => :layout
  end

  post '/signup' do
    if params[:password] != params[:confirm_password]
      flash[:notice] = 'The passwords do not match. Please try again.'
      redirect '/signup'
    end
    
    user = User.create(username:params[:username], password:params[:password], name:params[:name], email:params[:email])
    
    if user
      flash[:notice] = 'The account has been successfully created. Please log in.'
      redirect '/'
    else 
      flash[:notice] = 'The email or username is already taken. Please try another one.'
      redirect '/signup'
    end
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user] = user.email
      flash[:notice] = "Welcome back, #{user.username}!"
      redirect '/home'
    else
      flash[:notice] = "The email or password did not match our records. Please try again."
      redirect '/'
    end
  end

  get '/follow/:username' do
    flash[:notice] = "You are now following @#{params[:username]}"
    redirect '/home'
  end


  get '/home' do
    @user = User.find(session[:user])
    @users = User.all
    @messages = Message.all
    erb :home, :layout => :layout
  end

  post '/new' do
    @user = User.find(session[:user])
    flash[:notice] = "The message exceeds 240 characters." unless Message.create(params[:new_message], @user.id)
    redirect '/home'
  end

  delete '/sessions' do
    flash[:notice] = "Goodbye!"
    session.delete(:user)
    redirect '/'
  end

  get '/message/:id/edit' do
    @message = Message.find(params[:id])
    erb :edit
  end

  patch '/message/:id' do
    Message.edit(params[:id], params[:content])
    flash[:notice] = "Succesfully updated."
    redirect '/home'
  end

  delete '/message/:id' do
    Message.delete(params[:id])
    flash[:notice] = "Message has been successfully deleted."
    redirect '/home'
  end
  
  get '/message/:id/tag' do
    @message = Message.find(params[:id])
    @users = User.all
    erb :tag
  end

  post '/message/:id/tag/:user_id' do
    Tag.create(params[:id], params[:user_id])
    user_email = User.find_email(params[:user_id])
    # mail = Mail.new do
    #   from     'jarjeb@gmail.com'
    #   to       "#{user_email}"
    #   subject  'You were tagged in a peep'
    #   body     'Check out Chitter to see the tagged message'
    # end
    # mail.deliver!
    flash[:notice] = "Succesfully tagged. An email was sent to the user."
    redirect '/home'
  end

end
