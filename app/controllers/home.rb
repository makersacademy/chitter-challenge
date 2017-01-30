class Chitter < Sinatra::Base
  get '/' do
    @peep = Peep.all(:order => [ :created_at.desc ])
    erb :index
  end
end
