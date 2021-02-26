require 'sinatra/base'
require 'pg'
require './lib/peep'

class ChitterApp < Sinatra::Base

  enable :sessions, :method_override

  get '/' do
    @feed = Peep.all
    erb :feed
  end


  get '/feed/new' do
    erb :feed_new
  end


  post '/new' do
    Peep.add(content: params[:content])
    redirect '/'
  end

end
