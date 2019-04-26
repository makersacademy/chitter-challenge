require 'sinatra/base'

class ChitterChallenge < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/peeps' do
    @peep = params[:peep]
    erb :peeps
  end

  run! if app_file == $0
end
