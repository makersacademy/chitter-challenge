require 'sinatra/base'
require './lib/peep'
require './spec/setup_databases'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  get '/peeps' do
    @peeps = Peep.all(order: [:created_at.desc])
    erb :peeps
  end

  post '/peeps' do
    Peep.create(content: params[:peep], created_at: Time.now)
    redirect '/peeps'
  end

  run! if app_file == $0

end
 
