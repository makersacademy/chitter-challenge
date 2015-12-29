class Chitter < Sinatra::Base
  delete '/logout' do
    env["rack.session"][:user_id] = nil
    flash.next[:notice] = 'Goodbye!'
    redirect to('/')
  end

  post '/login' do
    user = User.authenticate(params[:username], params[:password])
    if user
      env["rack.session"][:user_id] = user.id
      redirect to('/peeps')
    else
      flash.next[:login_fail] = ["Either you've not registered, or your password is wrong"]
      redirect to '/'
    end
  end
end
