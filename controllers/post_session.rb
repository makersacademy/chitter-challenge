class Chittter < Sinatra::Base  
  post '/sessions' do
    email, password = params[:email], params[:password]
    user = User.authenticate(email, password)
    if user
      puts "here"
      session[:username] = user.username
      redirect('/')
    else
      flash[:message] = 'email or password is incorrect'
      redirect('/sessions/new')
    end
  end
end