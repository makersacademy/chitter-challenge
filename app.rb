require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
    erb :index
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps' do
    p params
    p "form data"
  end

end