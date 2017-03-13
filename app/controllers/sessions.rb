class Chitter < Sinatra::Base

  post '/new_user' do
    User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    session[:username] = params[:username]
    redirect '/welcome'
  end

  post '/return_user' do
    session[:username] = params[:username]
    session[:password] = params[:password]
    usr = session[:username]
    usr_password = session[:password]
    User.verify(usr, usr_password) ? (redirect '/welcome') : (redirect '/')
  end

  delete '/sessions' do
    session[:user_id] = nil
    @username = session[:username]
    redirect to '/'
  end

end
