require 'sinatra/base'
require_relative './lib/chitter'

class ChitterManager < Sinatra::Base
  enable :sessions

  before do
    @chitter = Chitter
  end

  get '/' do
    erb :index
  end

  post '/peeps' do
    @chitter.create(peep: params[:peeps])
    redirect '/peeps'
  end

  get '/peeps' do
    erb :peeps
  end


  run! if app_file == $0
end