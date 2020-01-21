require 'sinatra/base'
require_relative './lib/peeps'
require_relative './database_connection_setup'


class Chitter < Sinatra::Base
  get '/' do
    'Hello World'
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps' do
    Peeps.create(message: params[:message])
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peeps.all
    erb :'peeps/index'
  end

  run! if app_file == $0
end
