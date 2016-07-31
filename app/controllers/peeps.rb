
class Chitter < Sinatra::Base

  get '/peeps' do
    @peep = Peep.new
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps/new' do
    @peep = Peep.new(message: params[:message])
    @current_user.peeps << @peep
    redirect to('/peeps')
  end

end
