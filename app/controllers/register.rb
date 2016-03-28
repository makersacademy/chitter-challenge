class Chitter < Sinatra::Base

  get '/signup' do
    erb :'signup/index'
  end

  post '/account/create' do
    user = User.new(name: params[:name],
                    username: params[:username],
                    email: params[:email],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation])
    if user.save
      flash.next[:notice] = "Account created. Please log in."
      redirect to '/'
    else
      flash.next[:errors] = user.errors.full_messages
      redirect to '/signup'
    end
  end
  
end
