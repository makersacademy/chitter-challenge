ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'data_mapper'
require 'sinatra/flash'
require_relative 'datamapper_setup'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  get '/' do
    erb :index
  end

  get '/signup' do
    erb :'/users/new'
  end

  post '/signup' do
    @user = User.new(email: params[:email], user_name: params[:user_name],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    if @user.save
      flash.keep[:notification] = 'Thank you for signing up, please sign in to continue'
      redirect '/'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'/users/new'
    end
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
