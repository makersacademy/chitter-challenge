class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.reverse_order
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(message: params[:message], user_id: current_user.id)
    redirect '/peeps', 303
  end

end
