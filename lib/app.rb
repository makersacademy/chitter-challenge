require 'sinatra/base'

require_relative 'models/peep.rb'

class Chitter < Sinatra::Base
  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :index
  end

  post '/peeps/new' do
    Peep.create(user_id: 1, content: params[:peep_text])
    redirect '/'
  end
end
