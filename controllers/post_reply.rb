class Chittter < Sinatra::Base
  post '/reply' do
    reply = Reply.create(reply: params[:reply])
    peep = Peep.first(id: session[:reply_id])
    peep.replys << reply
    peep.save
    redirect '/'
  end
end