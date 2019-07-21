require 'sinatra/base'
require_relative './lib/message'
# require_relative 'chitter'

class ChitterManager < Sinatra::Base

  get '/' do
    erb :"index"
  end

  get '/peeps' do
    @peeps = Message.all
    erb :"peeps/index"
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps' do
    Message.post(message: params[:message])
    redirect '/peeps'
  end

  run! if app_file == $0

end
