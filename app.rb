require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    "Welcome to Chitter!"
  end

  get '/peeps' do
    erb(:'peeps/index')
  end

  get '/peeps/new' do
    erb(:'peeps/new')
  end

  post '/peeps' do
    params[:peep_text]
  end

end
