class Chitter < Sinatra::Base
  get '/reply' do
    erb :'replies/reply'
  end

  post '/reply' do
    reply = Reply.create(text: params[:reply], replier: current_user.username, time: Time.now.asctime)
    reply.save
    redirect '/peeps'
  end
end
