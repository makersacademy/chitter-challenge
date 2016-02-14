class Chitter < Sinatra::Base

  get '/peeps/reply' do
    @peep_id = params['peep_id']
    erb :'peeps/reply'
  end

  get '/peeps/view-replies' do
    peep_id = params['peep_id']
    @replies = Reply.all(peep_id: peep_id)
    erb :'peeps/view_replies'
  end

  post '/peeps/new' do
    Peep.create(peep: params[:peep], time_stamp: Time.now, user_id: current_user.id )
    redirect '/'
  end

  post '/peeps/reply' do
    reply = Reply.create(reply: params[:reply], time_stamp: Time.now, peep_id: params[:peep_id])
    redirect '/'
  end

end
