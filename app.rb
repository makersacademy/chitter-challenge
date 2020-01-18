require 'sinatra/base'
require './lib/peep.rb'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    p ENV['RACK_ENV']
    'Welcome to Chitter!'
    erb(:index)
  end
  
  post '/peeps/new' do
    session[:peep] = params[:peep]
    Peep.add(session[:peep])
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb(:peeps)
  end

  run! if app_file == $0
end