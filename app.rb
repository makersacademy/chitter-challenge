require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
    erb :index
  end

  get '/peeps' do
    
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

end