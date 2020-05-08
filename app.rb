require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/peeps' do
    @result = Peep.all
    erb(:index)
  end

  get '/peeps/new' do
    erb(:new)
  end

  post '/peeps' do
    p "Form data submitted to the /peeps route!"
    Peep.add(peep: params[:peep])
    redirect('/peeps')
  end
end
