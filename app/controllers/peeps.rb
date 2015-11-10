class Chitter < Sinatra::Base
  get '/peeps' do
    redirect('/sessions/new') if session[:user_id].nil?
    @name ||= current_user.first_name
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