class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps/new' do
    Peep.create(peep: params[:peep], user: User.first(id: session[:user_id]), created_at: Time.now)
    redirect to '/peeps'
  end

end
