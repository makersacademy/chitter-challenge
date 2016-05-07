ENV["RACK_ENV"] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
# require_relative 'models/link'
require_relative 'models/data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    erb :index
  end

  get '/sign_up' do
    erb :signup
  end

  post '/users' do
    user = User.create(  name: params[:name], username: params[:username],
                      email: params[:email], password: params[:password], 
                      password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash.now[:errors] = user.errors.full_messages
      @name = params[:name]
      @username = params[:username]
      @email = params[:email]
      erb :signup
    end
  end

  get '/peeps' do
  #   @links = Link.all
  #   erb :links
  end

  # post '/links' do
  #   link = Link.new( title: params[:title], url: params[:url])
  #   params[:tags].split(/,\s*/).each do |tag|
  #     link.tags << Tag.create(name: tag)
  #   end
  #   link.save
  #   redirect '/links'
  # end

  # get '/links/new' do
  #   erb :new
  # end

  # get '/links/tags/:name' do
  #   @links = Tag.all(name: params[:name]).links
  #   erb :links
  # end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
