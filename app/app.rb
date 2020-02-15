require 'sinatra/base'
require './lib/peeps.rb'
require './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  
  get '/' do
    "Welcome to Chitter!"
  end

  get '/peeps/index' do
    p @chitter_feed
    @peeps = Peeps.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peeps.create(url: params[:url], title: params[:title])
    redirect '/peeps/index'
  end

  run! if app_file == $0
end