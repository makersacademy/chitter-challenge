require 'pry'
 
class Chitter <Sinatra::Base

  get '/session/new' do
    erb (:'session/new')
  end

  post '/session' do
   user = User.authenticate(params[:email], params[:password])
   
   
     if user 
      session[:user_id] = user.id
      redirect('/feed')
    else
      flash.now[:errors]=['Sorry your email or password was inccorect!']
      erb(:'session/new')
    end
  end

  delete '/session' do
    session[:user_id] = nil
    flash.keep[:notice] = "Goodbye!"
    redirect('/feed')
  end
end