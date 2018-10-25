require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/new-cheet' do
    Cheet.create(params[:cheet])
    redirect '/'
  end


end
