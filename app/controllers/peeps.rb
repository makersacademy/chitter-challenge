class Chitter < Sinatra::Base
  get '/peeps' do
    @peeps = Peep.all(order: [:created_at.desc])
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps/add' do
    redirect '/peeps/new'
  end

  post '/peeps' do
    Peep.create(peep_content: params[:peep_content], user_id: session[:user_id])
    redirect '/peeps'
  end
end
