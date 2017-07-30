ENV['RACK_ENV'] ||= 'development'

require 'bcrypt'
require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'
require 'dm-validations'
require 'sinatra'
require 'sinatra/flash'
require './models/peep'
require './models/user'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  register Sinatra::Flash
  enable :sessions
  TIME_STAMP_FORMAT = "%d/%m/%Y at %l:%M%P"

  helpers do
    def current_user
      @current_user ||= User.get(session[:current_user_id])
    end
  end

  get '/users/new' do
    @user = User.new
    erb :new_user
  end

  get '/peeps/new' do
    erb :new_peep
  end

  post '/users/new' do
    @user = User.new(username:              params[:username],
                     email:                 params[:email],
                     password:              params[:password],
                     password_confirmation: params[:password_confirm])
    if @user.save
      session[:current_user_id] = @user.id
      redirect '/peeps'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :new_user
    end
  end

  post '/peeps/new' do
    Peep.create(message: params[:message])
    redirect '/peeps'
  end

  get '/peeps' do
    @user = current_user
    @peeps = Peep.all
    erb :peeps
  end

end
