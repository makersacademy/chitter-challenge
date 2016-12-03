ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  get '/' do
    "Hello"
  end

  get '/users/new' do
    erb :'/users/new'
  end

  post '/users' do
    user = User.new(email: params[:email], name: params[:name], username: params[:username])
    if user.save
      redirect '/peeps'
    end
  end

  get '/peeps' do

  end



  run! if app_file == $0

end
