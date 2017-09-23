ENV['RACK_ENV'] ||= 'test'

require_relative 'data_mapper_setup'

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
    erb(:new_peep)
  end
end
