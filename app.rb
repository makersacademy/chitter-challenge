require 'sinatra/base'
require_relative './models/peep.rb'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/username' do
    session[:username] = params[:username]
    redirect ('/feed')
  end

  post '/feed' do
    @username = session[:username]
    Peep.add(@username, params[:peep])
    redirect ('/feed')
  end

  get '/feed' do
    @username = session[:username]
    @peeps = Peep.all
    erb(:feed)
  end

  run! if app_file == $0
end
