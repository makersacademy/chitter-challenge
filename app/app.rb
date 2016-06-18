ENV['RACK_ENV'] = 'dev'

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  get '/' do
    "Homepage"
  end

  get '/user/new' do
    erb(:'user/new')
  end

  post '/user' do
    user = User.create(
      username: params[:username],
      name: params[:name],
      email: params[:email]
    )
    user.save
    redirect to('/')
  end

  run! if app_file == $0
end
