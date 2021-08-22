require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/chitter'

class Chittersweb < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/peeps' do
    @pip = Chitter.all
    @time_updated = Chitter.time
    erb :peeps
  end

  post '/peeps' do
    # Chitter.post(post: params[:new_peep])
    redirect '/peeps'
  end

  run! if app_file == $0
end
