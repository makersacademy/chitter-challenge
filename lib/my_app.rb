ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  get '/' do
    erb :user_sign_up
  end

  post '/signup' do
    User.create(name: params[:name],
                username: params[:username],
                email: params[:email],
                password: params[:password])
                # password_confirmation: params[:password_confirmation])
    redirect("/welcome/#{params[:username]}")
  end

  get '/welcome/:username' do
    @username = params[:username]
    erb :welcome
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
