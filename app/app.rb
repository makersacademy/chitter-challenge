ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require_relative 'models/peep'
require_relative 'models/user'

class Chitter < Sinatra::Base

  # DO WE WANT THIS?
  get '/' do
    'Hello Chitter!'
  end

  get '/signup' do
    erb :'signup'
  end

  post '/signup' do
    User.create(email:params[:email], password: params[:password])
    redirect '/peeps'
  end






  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps/' do
    User.create(email:params[:email], password: params[:password])
    redirect '/peeps'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
