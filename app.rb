require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/' do
    erb :welcome
  end

  get '/peeps' do
    @peeps = Peep.all
    erb(:peeps)
  end

  post '/peeps' do
    Peep.create(content: params[:peep_content])
    redirect '/peeps'
  end

  run! if app_file == $0
end
