require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    erb(:index)
  end

  get '/peeps' do
    @peep = params[:peep_content]
  end

  get '/peeps/new' do
    erb(:peeps_new)
  end

end
