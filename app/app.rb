require 'sinatra/base'
require 'sinatra/flash'
require './app/data_mapper_setup.rb'

class Chitter < Sinatra::Base

  enable :sessions
  set    :session_secret, 'super secret'
  register Sinatra::Flash

  get '/' do
    erb :front_page
  end

  get '/user/new' do
    @user = User.new
    erb :new_user
  end

  post '/user' do
    @user = User.create(name: params[:name],
                        email: params[:email],
                        username: params[:username],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/user'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :new_user
    end
  end

  get '/user' do
    erb :welcome_user
  end

  get '/session/new' do
    erb :sign_in
  end

  post '/session' do
    @user = User.get(username: params[:username],
                     password: params[:password])
    session[:user_id] = @user_id
    redirect '/user'
  end


  # get '/peep/new' do
  #   erb :new_peep
  # end

  # post '/peeps' do
  #   @peep = Peep.create(body: params[:body],
  #                       user: params[:user])
  #   erb :peeps
  # end


  helpers do

    def current_user
      @user ||= User.get(session[:user_id])
    end

  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
