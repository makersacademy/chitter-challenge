require 'pry'

class Chitter < Sinatra::Base

  get '/peeps/new' do
    @peeps = Peep.all
    erb :'peeps/new'
  end

  post '/peeps/new' do
    @peep = Peep.create(username: current_user.username,
                        peep: params[:peep],
                        time: Time.now)
    redirect('/peeps/new')
  end


end
