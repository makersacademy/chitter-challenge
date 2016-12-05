class Chitter < Sinatra::Base


  get '/sessions/new' do
     @user = User.new
    erb :log_in
  end

  post '/sessions' do
    user = User.authenticate(params[:email],params[:password])
    if user
      session[:id] = user.id
      @posts = Peep.all
      redirect ('/peeps')
    else
      flash.now[:notice] = "The password or email is not correct!"
      redirect ('sessions/new')
    end
  end



  delete '/sessions' do
    session[:id] = nil
    flash.keep[:notice] = "Goodbye!"
    @posts = Peep.all
    redirect("/peeps")
  end

end
