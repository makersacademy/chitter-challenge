class Chitter < Sinatra::Base
  get '/' do
    if current_user
      @peeps = Peep.all(order: [ :created_at.desc ])
      erb :'peeps/index'
    else
      erb :index
    end
  end
end
