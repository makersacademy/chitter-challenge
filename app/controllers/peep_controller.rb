class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    erb(:'/peeps/index')
  end

  # get '/peeps/new' do
  #   erb(:'/peeps/new')
  # end

end
