class ChitterApp < Sinatra::Base

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email:                 params[:email],
                       name:                  params[:name],
                       username:              params[:username],
                       password:              params[:password],
                       password_confirmation: params[:password_confirmation])
    if user.save
      session[:id] = user.id
      flash.next[:welcome_msg] = "Succesfully registered #{user.username}"
      redirect '/peeps'
    else
      flash.next[:errors] = user.errors.full_messages
      session[:email] = params[:email]
      session[:name] = params[:name]
      session[:username] = params[:username]
      session[:password] = params[:password]
      session[:password_confirmation] = params[:password_confirmation]
      redirect '/users/new'
    end
  end

end
