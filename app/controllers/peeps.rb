class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.all
    erb :'/peeps/index'
  end

  post '/peeps' do
    peep = Peep.create(message: params[:peep], user: current_user)
    current_user.peeps << peep
    current_user.save
    redirect to '/'
  end
end
