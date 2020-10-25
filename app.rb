require 'sinatra/base'
require_relative './lib/chitter.rb'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :sign_up
  end
  
  post '/:name' do
    session[:name] = params[:name]
    redirect('/welcome')
  end

  get '/welcome' do
    @name = session[:name]
    erb :welcome
  end

  get '/chitter_feed' do
    @peeps = Peep.all
    erb :chitter_feed
    # pass information from database to views - name, username, time, peep
  end

  get '/chitter_feed/new_peep' do
    erb :new_peep
  end

  post '/chitter_feed/posted_peep' do
    time = Time.now.strftime("%H:%M:%S")
    Peep.create(peep: params[:peep_text], time: time)
    redirect('/chitter_feed')
    # peep needs username, name, time posted
  end
end