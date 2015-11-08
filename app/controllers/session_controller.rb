class Chitter < Sinatra::Base

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions/new' do
    if User.authenticate(params[:username],
                         params[:password])
      user = User.first(username: params[:username])
      session[:user_id] = user.id
      redirect to('/chitter')
    else
      flash.next[:notice] = 'Wrong password. Please try again.'
      redirect to('/sessions/new')
    end
  end

  get '/sessions/none' do
    erb :'sessions/none'
  end

  delete '/sessions' do
    name = current_user.name
    session.clear
    flash.next[:notice] = "Goodbye, #{name}!"
    redirect to('/sessions/new')
  end
  
end