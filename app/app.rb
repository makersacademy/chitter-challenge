require 'sinatra/base'
require './lib/peep'

class ChitterApp < Sinatra::Base

  get '/timeline' do
    @timeline = Peep.timeline
    erb :index
  end

  post '/post/new' do
    @user_id = "Test User"
    Peep.add_post(@user_id, params[:post])
    redirect '/timeline'
  end

  get '/registration' do
    erb :registration
  end

  post '/registration/new' do
    
  redirect '/timeline'
  end
end