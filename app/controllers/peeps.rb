class Chitter < Sinatra::Base
  get '/peeps' do
    @name ||= User.first_name(session[:user_id])
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps/new' do
    new_peep = Peep.new(body: params['peep body'])
    current_user.peeps << new_peep
    current_user.save
    redirect('/peeps')
  end

end