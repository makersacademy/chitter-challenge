require 'sinatra/base'
require './lib/peep'
require 'pg'

class Chitter < Sinatra::Base

  get '/peeps/timeline' do
    @peeps = Peep.all
    erb :'peeps/timeline'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps/timeline' do
    Peep.create(name: params[:name], text: params[:text])
  
    redirect '/peeps/timeline'
  end

  run! if app_file == $0
end
