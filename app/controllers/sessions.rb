class Chitter < Sinatra::Base
  get '/sign_in' do
    @peeps = Peep.all
    erb :'sessions/sign_in'
  end

  post '/sign_in' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash[:notice] = 'The email or password is incorrect'
      redirect '/sign_in'
    end
  end

  delete '/logout' do
    session[:user_id] = nil
    flash.keep[:notice] = 'goodbye!'
    redirect '/sign_in'
  end
end
