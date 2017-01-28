ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class App < Sinatra::Base

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    erb:'peeps'
  end

  get '/sign_up' do
    erb:'sign_up'
  end

  post '/sign_up' do
    @user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    redirect '/log_in'
  end

  get '/log_in' do
    erb:'log_in'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
