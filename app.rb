require 'sinatra/base'
require './lib/Peep'

class ChitterManager < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all
    erb :'/peeps_index'
  end

  get '/peeps/new' do
    erb :'/create_peep'
  end

  post '/peeps' do
    Peep.create(peep_text: params[:peep_text], time: params[:time] )
    redirect '/peeps'
  end

  run! if app_file == $0
end
