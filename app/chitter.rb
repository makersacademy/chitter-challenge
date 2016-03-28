ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'models/peep'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.all
    erb :'peep/all'
  end

  get '/peep/new' do
    erb :'peep/new'
  end

  post '/peep' do
    Peep.create(body: params[:body])
    redirect '/'
  end

  get '/user/new' do
    erb :'user/new'
  end

  post '/user' do
    User.create(name: params[:name],
                username: params[:username],
                email: params[:email],
                password: params[:password])
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
