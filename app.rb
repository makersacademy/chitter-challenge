require 'sinatra/base'
require './lib/Peep'

class ChitterManager < Sinatra::Base
  enable :sessions

  get '/peeps' do
    @peeps = Peep.all
    erb :'/peeps_index'
  end

  get '/peeps/new' do
    erb :'/peeps/new'
  end

  post '/peeps/all' do
    redirect '/peeps'
  end

  run! if app_file == $0
end
