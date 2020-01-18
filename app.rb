require 'sinatra/base'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  post '/peeps/new' do
    redirect('/peeps')
  end

  get '/peeps' do
    "This is a peep!"
  end
end