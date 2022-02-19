require 'sinatra/base'
require 'sinatra/reloader'
require './lib/chitters'
# require 'capybara'
require 'pg'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Welcome to Chitter'
  end

  get '/addpeep' do
    erb :'peeps/addpeep'
  end

  post '/addpeep' do
    Chitters.addpeep(params[:peep])
    redirect '/peeps'
  end

  get '/peeps' do
    @peep = Chitters.view_peeps
    erb :'peeps/index'    
  end

  run! if app_file == $0
end

