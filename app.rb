require 'sinatra'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/' do
    "Hello, this is my first peep"
  end

  get '/peeps' do
    @peeps = Peep.all_peeps
    erb(:index)
  end

  

  # get '/peeps/new' do
  #   erb(:peeps_new)
  # end

  post '/peeps' do
    Peep.create_peep(content: params[:content])
    redirect('/peeps')
  end
  run! if app_file == $0
end
