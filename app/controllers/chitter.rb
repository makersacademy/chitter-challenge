class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    erb :'/peeps/index'
  end
end
