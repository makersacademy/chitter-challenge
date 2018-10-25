require 'sinatra/base'
require_relative 'lib/peep'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    'Hello world'
  end

  get '/peeps/post' do
    erb :post
  end

  post '/peeps/post' do
    Peep.create(message: params[:message])
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  run if app_file == $0
end
