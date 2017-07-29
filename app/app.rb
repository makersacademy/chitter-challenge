ENV['RACK_ENV'] ||= 'development'

require_relative 'app_setup'

class Chitter < Sinatra::Base

  get '/' do
    erb(:index)
  end

  get '/peeps' do
    @peeps = Peep.all.reverse
    erb(:peeps)
  end

  post '/peeps' do
    peepbody = params[:peepbody]
    Peep.create(body: peepbody)
    redirect '/peeps'
  end

  get '/peeps/new' do
    erb(:peep_new)
  end

end
