require 'sinatra/base'
require './lib/peep'
require_relative './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
    erb :index
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps/new' do
    Peep.create(content: params[:content], username: params[:username])
    redirect '/peeps'
  end

  run! if app_file == $0
end
