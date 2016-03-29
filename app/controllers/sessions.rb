class Chittr < Sinatra::Base

  get '/sessions/new' do
    erb :'/sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to :'/'
    else
      flash.now[:error] = ['Your log in details weren\'t correct.']
      erb :'/sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = "Thanks for your visit. Have a good day!"
    redirect to :'/'
  end

end
