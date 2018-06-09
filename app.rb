require 'sinatra/base'
require './lib/peep'
require 'sinatra/flash'
require 'pry'
require 'shotgun'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/peeps/show' do
    @peeps = Peep.all
    erb :"peeps/show"
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps/new' do
    flash[:notice] = "Your peep must be 280 characters or less" unless Peep.create(text: params['text'], user: params['user'])
    redirect '/peeps/show'
  end

  post '/peeps/:id/delete' do
    Peep.delete(id: params['id'])
    redirect '/peeps/show'
  end

  get '/peep/edit' do
    @id = params['id']
    erb :"/peeps/edit"
  end

  post '/peeps/edit1' do
    Peep.edit(id: params['id'], text: params['text'], user: params['user'])
    redirect '/peeps'
  end

  run! if app_file ==$0
end
