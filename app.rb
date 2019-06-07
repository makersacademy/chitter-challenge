require 'sinatra/base'
require './database_connection_setup'
require './lib/peep'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  get '/peeps/new' do
    erb :new_peep
  end

  post '/peeps/new/submit' do
    puts "***********"
    puts params
    Peep.create(params[:author],params[:handle],params[:content])
    puts "***********"
    redirect '/peeps'
  end


  run! if app_file == $0
end
