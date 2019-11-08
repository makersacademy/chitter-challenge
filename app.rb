require 'sinatra/base'
require 'sinatra/flash'
require './lib/beet'

class Bitter < Sinatra::Base
  register Sinatra::Flash

  get '/beets' do
    @beets = Beet.all
    p @beets
    erb(:beets)
  end

  get '/new_beet' do
    erb(:new_beet)
  end

  post '/post_beet' do
    p params
    redirect '/beets'
  end

  run! if app_file == $0
end