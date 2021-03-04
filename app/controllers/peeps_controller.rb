class Chitter < Sinatra::Base
  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    redirect '/peeps' unless session[:user_id]
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(content: params[:peep], user_id: session[:user_id])
    redirect '/peeps'
  end

  get '/peeps/:id/edit' do
    @peep = Peep.find(id: params[:id])
    redirect '/peeps' unless @user.id == @peep.id
    erb :'peeps/edit'
  end

  patch '/peeps/:id' do
    Peep.update(id: params[:id], content: params[:peep])
    redirect "/users/:id/peeps"
  end

  delete '/peeps/:id' do
    Peep.delete(id: params[:id])
    redirect '/users/:id/peeps'
  end
end
