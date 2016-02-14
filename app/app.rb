ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'models/user'
require_relative 'data_mapper_setup'


class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    redirect '/home'
  end

  get '/home' do
    @current_user = session[:user_id]
    erb :home_page

  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    @user = User.new(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
        session[:user_id] = @user.name
        redirect '/home'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :sign_up
    end
  end




  # start the server if ruby file executed directly
  run! if app_file == $0
end
