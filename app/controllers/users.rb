class Chitter < Sinatra::Base

  get '/users/new' do
    erb :'users/new'
  end

  post '/users/new' do
    @new_user = User.new(
              username:              params['username'],
              email:                 params['email'],
              name:                  params['name'],
              password:              params['password'],
              password_confirmation: params['password_confirmation'])
    if @new_user.save
      session[:user_id] = @new_user.id
      redirect('/main/peeps')
    else
      save_entered_details
      process_errors(@new_user)
      assign_errors
      erb :'users/new'
    end
  end

end