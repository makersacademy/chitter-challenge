
class Chitter < Sinatra::Base

  get '/posts/view' do
    @messages = Message.all
    erb :'posts/view'
  end

  post '/posts/view' do
    message = Message.create(content: Sanitize.clean(params[:peep]), created_at: Time.new)
    current_user.messages << message
    current_user.save
    redirect '/posts/view'
  end

end