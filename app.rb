require 'sinatra/base'
require './lib/peep'
#require 'sinatra/flash'
require 'pry'
require 'shotgun'

class Chitter < Sinatra::Base
  enable :sessions
  #register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  get '/peep/new' do
    erb :"peep/new"
  end

  post '/peep/:id' do
    #flash[:notice] = "Peep can not exceed 280 characters" unless Peep.create(text: params['text'], usere: params['user'])
    redirect '/peeps'
  end

  post '/peep/:id/delete' do
    Peep.delete(id: params['id'])
    redirect '/peeps'
  end

  get '/peep/edit' do
    @id = params['id']
    erb :"/peep/edit"
  end

  post '/peeps/edit1' do
    Peep.edit(id: params['id'], text: params['text'], user: params['user'])
    redirect '/peeps'
  end

  run! if app_file ==$0
end
