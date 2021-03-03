class Chitter < Sinatra::Base
  get '/users/:id/show' do
    erb :'users/index'
  end

  get '/users/:id/edit' do
    erb :'users/edit'
  end

  patch '/users/:id' do
    User.update(id: params[:id], name: params[:name],
      username: params[:username], email: params[:email])
    redirect '/users/:id/show'
  end

  get '/users/delete' do
    erb :'users/delete'
  end

  delete '/users/:id/delete' do
    User.delete(id: params[:id])
    session.clear
    flash[:notice] = 'Your account has been deleted.'
    redirect '/peeps'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(name: params[:name], email: params[:email],
      username: params[:username], password: params[:password])

    session[:user_id] = user.id
    redirect '/peeps'
  end

  get '/users/:id/peeps' do
    @peeps = Peep.my_peeps(user_id: @user.id)
    erb :'users/peeps'
  end
end
