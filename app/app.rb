ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  get '/' do
    @users = User.all
    erb :index
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new
    user = User.create(email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    if user.save # #save returns true/false depending on whether the model is successfully saved to the database.
      session[:user_id] = user.id
      redirect('/')
    else
      @ciao = ["Name is too short (minimum is 5 characters)", "Name can't be blank", "Email can't be blank"]
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end


  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
  end

  # post '/links' do
  #   link = Link.new(title: params[:title], url: params[:url])
  #   params[:tags].split.each do |tag|
  #     link.tags << Tag.create(name: tag)
  #   end
  #   link.save
  #   redirect('/links')
  # end
  #
  # get '/links' do
  #   @links = Link.all
  #   erb :links
  # end
  #
  # get '/links/new' do
  #   erb :links_new
  # end
  #
  # get '/tags/:name' do
  #   tag = Tag.first(name: params[:name])
  #   @links = tag ? tag.links : []
  #   erb :links
  # end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
