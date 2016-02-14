ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'data_mapper'
require_relative '../models/data_mapper_setup'


class Chitter < Sinatra::Base
  get '/' do
    'THIS. IS. CHITTERRR!'
    erb :index
  end

  get '/sign_up/new' do
    erb :sign_up
  end

  post '/sign_up' do
    user = User.create(username: params[:username],
                           name: params[:name],
                          email: params[:email_address],
                       password: params[:password],
          password_confirmation: params[:password_confirmation])
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
