
class Chitter

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    if params[:password] == params[:password_confirmation]
      user_name = params['user_name']
      User.create(email: params['email'],
                  name: params['name'],
                  user_name: params['user_name'],
                  password_digest: params['password'])
      "Welcome, #{user_name}!"
    else
      "Passowrds don\'t match"
    end
  end

end