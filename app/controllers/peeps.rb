class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = []
    peep = Peep.all
    peep.each {|chit| @peeps << chit}
    @peeps.reverse!
    @user = User.get(session[:user_id])
    erb :'peeps/index'
  end

  post '/peeps/new' do
    user = User.get(session[:user_id])
    peep = user.peeps.create(message: params[:message])
    redirect '/peeps'
  end

end
