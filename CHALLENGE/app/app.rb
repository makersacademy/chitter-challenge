ENV['RACK_ENV'] ||= 'dev'

require 'sinatra/base'
require_relative './data_mapper_setup'

class Chitter < Sinatra::Base

  get '/' do
    redirect '/homepage'
  end

  get '/homepage' do
    erb :homepage
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/new_user' do
    User.create(username: params['Username'], email: params['E-mail'], password: params['Password'])
    # redirect '/:Username'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
