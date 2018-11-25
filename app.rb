require 'sinatra/base'
require './database_connection_setup'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/' do
    'Welcome to Chitter'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/create' do
    Peep.create(user_name: params[:user_name], time_stamp: 'NOW()',
                text: params[:text])
    redirect '/peeps'
  end

  run! if app_file == $0
end
