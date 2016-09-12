ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'
require 'bcrypt'

class Chitter < Sinatra::Base
  enable :sessions
  # set :session_secret; 'super_secret'
  register Sinatra::Flash

  helpers do
    def the_user
      @the_user ||= User.get(session[:id])
    end
  end

  get '/home' do
    @peeps = Peep.all
    erb :'home'
  end

  post '/home' do
    peep = Peep.new(content: params[:peep], time: Time.new)
    peep.save
    redirect '/home'
  end

  get '/home/new' do
    erb :'peeps/new_peep'
  end

  get '/sign_up' do
    erb :'users/sign_up'
  end

  post '/sign_up' do
    @user = User.new(email: params[:email],
              password: params[:password],
              password_confirmation: params[:password_confirmation],
              name: params[:name],
              user_name: params[:user_name])
    if @user.save
        session[:id] = @user.id
        redirect '/home'
    else
        flash.now[:error] = @user.errors.full_messages
        erb :'users/sign_up'
    end
  end

end
