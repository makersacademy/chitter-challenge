require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  enable :sessions

  get '/home' do
    @peeps = Peep.all
    erb :home
  end

  get '/post' do
    erb :post
  end

  post '/home' do
    Peep.add(post: params[:post])
    redirect :home
  end

end
