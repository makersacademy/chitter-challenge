class Chitter < Sinatra::Base

  get '/sessions/new' do
    erb(:'sessions/new')
  end

  get '/sessions' do
    erb(:index)
  end

  post '/sessions' do
    authenticated_maker = Maker.authenticate(params[:email], params[:password])
    if authenticated_maker
      session[:user_id] = authenticated_maker.id
      redirect('/sessions')
    else
      flash.now[:errors] = "The email or password is incorrect. Please try again."
      erb(:'sessions/new')
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = "Goodbye!"
    redirect('/')
  end

end
