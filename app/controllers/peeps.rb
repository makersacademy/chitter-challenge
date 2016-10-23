class Chitter < Sinatra::Base

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps/new' do
    time = Time.now
    peep = Peep.create(
      peep_text: params[:peep_text],
      time: time,
      user: current_user
    )
    redirect '/peeps_list'
  end

  get '/peeps_list' do
    @peeps = Peep.all
    erb :'peeps_list'
  end
end
