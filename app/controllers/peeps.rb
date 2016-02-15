class Chitter < Sinatra::Base
  get '/home' do
    @peeps = Peep.all
    erb :home
  end

  post '/peep/new' do
    Peep.create(body: params[:peep], time: Time.now,  user: current_user)
    redirect '/home'
  end
end
