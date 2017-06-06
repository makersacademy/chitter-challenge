class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all(:order => [:id.desc])
    erb :'peeps/index'
  end
end
