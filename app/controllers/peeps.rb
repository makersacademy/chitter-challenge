class Chitter < Sinatra::Base

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.reverse_time_order
    # Peep.reverse_time_order
    erb :'/peeps'
  end

  get '/create_peep' do
    erb :'/create_peep'
  end

  post '/peeps' do
    time = Time.now
    # user = current_user
    peep = current_user.peeps.new(content: params['peep'], creation: time)
    peep.save!
    redirect '/peeps'
  end

end
