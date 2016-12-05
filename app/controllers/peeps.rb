class Chitter < Sinatra::Base

  post '/peeps' do
    peep = Peep.create(content: params[:content], user_id: current_user.id)
    redirect '/'
  end

  get '/peeps/new' do
    if current_user == nil
      redirect '/sessions/new'
    else
      erb :'peeps/new'
    end
  end

  get '/peeps/:id' do
    @peep = Peep.get(params[:id])
    @username = User.get(@peep.user_id).username
    erb :'peeps/get'
  end

end
