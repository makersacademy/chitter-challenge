class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all(:order => :time_created.desc)
    erb :home
  end

end
