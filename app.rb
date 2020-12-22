require 'sinatra/base'
require './lib/peep.rb'

class Chitter < Sinatra::Base

  get '/' do
    erb(:index)
  end

  get '/peeps/new' do
    erb(:peeps_new)
  end

  post '/peeps' do
    Peep.add(params[:peep_content], Time.now.strftime("%I:%M %p"))
    redirect('/peeps')
  end

  get '/peeps' do
    @peep = Peep.all.reverse
    erb(:peeps)

  end

end
