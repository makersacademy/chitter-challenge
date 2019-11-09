require 'sinatra/base'
require 'sinatra/flash'
require './lib/beet'

class Bitter < Sinatra::Base
  register Sinatra::Flash

  get '/beets' do
    @beets = Beet.all
    erb(:beets)
  end

  get '/new_beet' do
    erb(:new_beet)
  end

  post '/post_beet' do
    @text = params[:beet_text]
    Beet.add(@text)
    redirect '/beets'
  end

  run! if app_file == $0
end