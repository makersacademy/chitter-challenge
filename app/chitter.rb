ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  register Sinatra::Flash

  helpers do
    def current_maker
      @current_maker ||= Maker.get(session[:user_id])
    end
  end

  get '/' do
    erb(:index)
  end

  post '/users' do
    @maker = Maker.new(
              full_name:              params[:full_name],
              user_name:              params[:user_name],
              email:                  params[:email],
              password:               params[:password],
              password_confirmation:  params[:password_confirmation]
              )
    if @maker.save
      session[:user_id] = @maker.id
      redirect('/sessions')
    else
      flash.now[:notice] = "Password and confirmation password do not match"
      erb(:signup)
    end
  end

  get '/users/new' do
    @maker = Maker.new
    erb(:signup)
  end

  get '/sessions/new' do
    erb(:'sessions/new')
  end

  get '/sessions' do
    erb(:index)
  end

  post '/sessions' do
    authenticated_maker = Maker.authenticate(params[:email], params[:password])
    if authenticated_maker
      session[:user_id] = authenticated_maker.id
      redirect('/sessions')
    else
      p 'not authenticated'
      flash.now[:errors] = "The email or password is incorrect"
      erb(:'sessions/new')
    end
  end

end
