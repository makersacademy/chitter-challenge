require 'sinatra/base'

class ChitterApp < Sinatra::Base

  get '/timeline' do
    @timeline = Peeps.all
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