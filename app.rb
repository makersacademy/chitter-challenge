require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base


  get '/' do
    'Chitter!'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb:'peeps/index'
  end

  get '/post_peep' do
    erb:'peeps/post_peep'
  end

  post '/post_peep' do
    Peep.post(message: params[:message], handle: params[:handle], time: params[:time])
    redirect '/peeps'
  end


  run if app_file == $0
end
