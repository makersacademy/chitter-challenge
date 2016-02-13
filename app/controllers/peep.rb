class Chitter < Sinatra::Base

  post '/peeps/new' do
    Peep.create(peep: params[:peep], time_stamp: Time.now, user_id: current_user.id )
    redirect '/'
  end

end
