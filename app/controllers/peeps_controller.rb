class Chitter

  get '/peeps/new' do
    erb :'/peeps/new'
  end

  post '/peeps/new' do
    if session[:user_id]
      user = User.first(id: session[:user_id])
      peep = user.peeps.create(peep_body: params[:peep_body], peep_time: Time.new)
      if Peep.first(peep_body: params[:peep_body])
        flash.now[:notification] = 'Your Peep was sucessfully Peeped'
        erb :'/sessions/home'
      else
        flash.now[:notification] = 'Sorry, there was a problem posting your peep; please try again'
        erb :'sessions/home'
      end
    else
      flash.now[:notification] = 'Sorry, peeps cannot be posted unless you are logged in'
    end
  end

  get '/peeps/view' do
    @peeps = Peep.all(order: :peep_time.desc)
    erb :'peeps/view'
  end

end
