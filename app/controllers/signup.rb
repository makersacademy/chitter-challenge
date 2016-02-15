class Chitter < Sinatra::Base

  get '/sign_up' do
    erb :'./signup'
  end

  post '/sign_up' do
    user = User.new(name: params['name'], username: params['username'], email: params['email'])
    user.password = params['password']
    user.password_confirmation = params['password_confirmation']
    if user.save
      session[:id] = user.id
      redirect '/'
    else
      flash.now[:errors] = user.errors.full_messages
      flash.now[:email] = params['Email']
      erb :'./signup'
    end
  end

end
