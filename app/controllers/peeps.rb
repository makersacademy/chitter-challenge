class Chitter < Sinatra::Base

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    current_user.peeps.create(peeps: params[:peep], time: Time.now)
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

end
