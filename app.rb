require 'sinatra/base'
require './models/peep.rb'

# Chitter class
class Chitter < Sinatra::Base

  get '/' do
    'Welcome to Chitter'
  end

  get '/peeps' do
    @peeps = Peep.all_peeps
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps' do
    Peep.create(message: params[:Message])
    redirect '/peeps'
  end

  run! if app_file == $0
end