class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all(:order => [:time.desc])
    erb :index
  end

end
