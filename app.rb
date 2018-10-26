require 'sinatra/base'
require 'peep'

class Chitter < Sinatra::Base
  get '/' do

    @peeps = Peep.view_all
    erb :index
  end

  post '/post-peep' do
    Peep.post_peep(message: params[:message])
    redirect '/'
  end

  run! if app_file == $0
end
