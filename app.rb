require 'sinatra/base'
require './lib/message'

class Chitter < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
    erb :index

  end

  get '/peeps' do
    @peeps = Message.all
    erb :peeps
  end
  

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps' do
    Message.add(author: params[:author], body: params[:body], date: params[:date])
    redirect '/peeps'
  end

  run! if app_file == $0
end
