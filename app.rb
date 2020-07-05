require 'sinatra'
require './lib/peep'
require 'pg'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/peep/new' do
    erb :peep_new
  end

  post '/peep/new' do
    Peep.create(params[:user], params[:user_handle], params[:message], Time.now.strftime("%I:%M %p %d/%m/%Y"))
    redirect '/peep/all'
  end

  get '/peep/all' do
    @peeps = Peep.all.reverse
    erb :peep_all
  end

  run! if app_file == $PROGRAM_NAME
end