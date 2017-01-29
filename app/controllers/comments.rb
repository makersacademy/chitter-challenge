class Chitter < Sinatra::Base

  post '/comment' do
    Comment.create(content: params[:'comment-content'],
                     timestamp: Time.now,
                     user_id: session[:user_id],
                     peep_id: params[:'peep-id'])
    redirect '/'
  end

end
