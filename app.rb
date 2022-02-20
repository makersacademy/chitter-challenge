require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep.rb'

class Chitter < Sinatra::Base
  configure :development do 
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/peep' do
    erb :peep
  end

  post '/new-peep' do
    p params
    @name = params[:name]
    @username = params[:username]
    @message = params[:message]
    @peep = Peep.new_peep
    redirect '/'
  end

  run! if app_file == $0
end
