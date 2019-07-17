require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/create' do
    erb :create
  end

  post '/peeps' do
    @peep_text = params[:body]
    redirect '/'
  end

  get '/peeps' do
    erb :peeps
  end
end
