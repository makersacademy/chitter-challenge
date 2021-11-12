require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader' if development?

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/Peeps' do
    # 'Here are the latest Peeps!'
    #  'Peeps are viewable with the newest at the top:'
    @peeps = Chitter.all
    erb :view_peeps
  end

  run! if app_file == $PROGRAM_NAME
end
