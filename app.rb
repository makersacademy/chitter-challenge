require 'sinatra/base'
require "./lib/chitter"

class ChitterApp < Sinatra::Base

  get '/' do
    @peeps = Chitter.feed
    erb :index
  end

  get '/postmessage' do
    erb :postmessage
  end

  post '/postmessage' do
    Chitter.create(peep: params[:peep])
    redirect '/'
  end

  run! if app_file == $0

end
