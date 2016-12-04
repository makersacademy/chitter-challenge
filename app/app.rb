ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base


  get '/' do
    #I want erb index to show list of peeps
    erb :index
  end

  get '/sign-up/new' do
    erb :sign_up
  end

  post '/sign-up' do
    @user = User.create(email: params[:email], name: params[:name], username: params[:username], password: params[:password])
    redirect '/'
  end

  get '/peep/new' do
    erb :peep
  end

  post '/peep' do
    @peep = Peep.create(params[:peep])
    redirect '/'
  end

  get '/log-in/new' do
    erb :log_in
  end

  post 'signed-in' do

  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
