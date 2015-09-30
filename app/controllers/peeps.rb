module BeefBurgers
  module Routes
    class Peeps < Base

      get '/peeps/new' do
        redirect('/no_peepy') unless session[:user_id]
        erb :'peeps/new'
      end

      get '/no_peepy' do
        flash[:no_peepy] = "sign in or register to get peeping!"
        redirect('/')
      end

      post '/peeps' do
        user = User.first(user_id: session[:user_id])
        peep = Peep.create(body: params[:body], peeper: user.username, timestamp: Time.now)
        user.peeps << peep
        user.save
        flash[:peep_confirmation] = "Well done, you've just peeped!"
        redirect('/')
      end

    end
  end
end