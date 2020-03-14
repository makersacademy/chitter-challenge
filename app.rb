require 'sinatra/base'
require './lib/chitter'

class ChitterChallenge < Sinatra::Base

  get '/chitter' do
    @peeps = Chitter.print_peeps
    erb :chitter
  end

  get '/chitter/post_peep' do
    erb :'chitter/post_peep'
  end

  post '/chitter/post_peep' do
    Chitter.post_peep(peep: params[:peep], post_time: '12:00')
    redirect '/chitter'
  end

  run! if app_file == $0
end
