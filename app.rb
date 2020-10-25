require 'sinatra/base'
require_relative './lib/chitter.rb'

class Chitter < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/chitter_feed' do
    @peeps = Peep.all
    erb :chitter_feed
    #pass information from database to views - name, username, time, peep
  end

  get '/chitter_feed/new_peep' do
    erb :new_peep
  end

  post '/chitter_feed/posted_peep' do
    time = Time.now
    Peep.create(peep: params[:peep_text], time: time)
    redirect('/chitter_feed')
    #peep needs username, name, time posted
  end
end