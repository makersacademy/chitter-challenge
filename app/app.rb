ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/users/new' do
    @user = User.new
    erb(:'users/new')
  end

  post '/users' do
    @user = User.new(email: params[:email],
             name: params[:name],
             username: params[:username],
             password: params[:password],
             password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect('/posts/all')
    else
      flash.now[:notice] = "Password and confirmation password do not match"
      erb(:'users/new')
    end
  end

  get '/posts/all' do
    @peeps = Peep.all
    erb(:'posts/all')
  end

  post '/posts/new' do
    peep = Peep.create(content: params[:new_peep], posted_at: Time.now, user_id: session[:user_id])
    redirect('/posts/all')
  end

  get '/posts/new' do
    erb(:'posts/new')
  end

end
