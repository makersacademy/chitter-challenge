require 'sinatra/base'


class ChitterApp < Sinatra::Base

  enable :sessions, :method_override

  get '/' do
    erb :feed
  end


  get '/feed/new' do
    erb :feed_new
  end


  post '/new' do
    redirect '/'
  end

end
