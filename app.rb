require 'sinatra'
require 'sinatra/flash'
require_relative 'db_connection_setup'
require_relative './lib/user'
require_relative './lib/message'
require 'pony'

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    @user = User.find(session[:user_id])
    @messages = Message.all
    erb(:index)
  end

  get '/users/new' do
    erb(:'/users/new')
  end

  post '/users' do
    user = User.create(params[:email], params[:password], params[:name], params[:username])
    if user
      session[:user_id] = user.id
      redirect '/'
    else
      flash[:error] = 'Email or Username exists.'
      redirect('/users/new')
    end
  end

  get '/sessions/new' do
    erb(:'/sessions/new')
  end

  post '/sessions' do
    user = User.sign_in(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect('/')
    else
      flash[:error] = 'Please check your email or password.'
      redirect('/sessions/new')
    end
  end

  get '/sessions/destroy' do
    session.clear
    redirect('/')
  end

  post '/messages' do
    p params
    message = Message.add(params[:content], params[:user_id])
    begin
      if message.tagged_user_emails.any?
        message.tagged_user_emails.each do |recipient|
          Pony.mail :to => recipient,
            :from => "noreply@chitter.com",
            :subject => "Chitter: you are tagged by #{message.name}"
        end
      end
    rescue StandardError => e
      p e
    end
    redirect('/')
  end

  run! if app_file == $0
end
