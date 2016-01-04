class Chitter < Sinatra::Base
  get '/reply' do
    session[:peep_id] = params[:peep_id]
    erb :'replies/reply'
  end

  post '/reply' do
    peep = Peep.get(session[:peep_id])
    reply = Reply.new(text: params[:reply], replier: current_user.username, time: Time.now.asctime)
    peep.replies << reply
    reply.save
    redirect '/peeps'
  end
end
