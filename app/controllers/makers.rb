class Chitter < Sinatra::Base

  post '/users' do
    @maker = Maker.new(
              full_name:              params[:full_name],
              user_name:              params[:user_name],
              email:                  params[:email],
              password:               params[:password],
              password_confirmation:  params[:password_confirmation]
              )
    if @maker.save
      session[:user_id] = @maker.id
      redirect('/sessions')
    else
      flash.now[:notice] = "Password and confirmation password do not match"
      erb(:signup)
    end
  end

  get '/users/new' do
    @maker = Maker.new
    erb(:signup)
  end

end
