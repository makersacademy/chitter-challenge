require 'sinatra/base'
require './lib/peep'

class ChitterApp < Sinatra::Base

  get '/timeline' do
    @timeline = Peep.timeline
    erb :index
  end

  post '/post/new' do
    
  end

  get '/registration' do
    erb :registration
  end

  post '/registration/new' do
    
  redirect '/timeline'
  end
end