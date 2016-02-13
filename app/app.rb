
ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  register Sinatra::Flash

  get '/' do
    erb :'/home'
  end

  get '/sign_up' do
    erb :'/sign_up'
  end

  post '/sign_up_complete' do
    user = User.new(name: params[:name], email: params[:email], username: params[:username], password: params[:password], password_confirm: params[:password_confirm])
    if user.save
      session[:user_id] = user.id
      redirect '/'
    else
      flash.now[:errors] = user.errors.full_messages
      erb :'sign_up'
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
