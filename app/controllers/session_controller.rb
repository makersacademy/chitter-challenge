class Chitter < Sinatra::Base
  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/peeps')
    else
      flash[:errors] = ['Invalid email or password']
      redirect to('/sessions/new')
    end
  end

  delete '/sessions' do
    flash[:notice] = "Goodbye, #{current_user.name}"
    session[:user_id] = nil
    redirect to('/peeps')
  end
end
