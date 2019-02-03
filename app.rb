require 'sinatra/base'
require_relative 'lib/peep'
require_relative 'spec/web_helpers'

class Chitter < Sinatra::Base

  get '/' do
    erb(:index)
  end

  get '/peeps' do
    @peeps = Peep.all.reverse
    erb(:peeps)
  end

  post '/post_peep' do
    Peep.post(peep: params[:peep])
    redirect '/peeps'
  end

  run! if app_file == $0
end
