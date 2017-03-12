class Chitter < Sinatra::Base

  post '/comments/new' do
    Comment.create(content: params[:'comment-content'],
                     timestamp: Time.now,
                     user_id: session[:user_id],
                     peep_id: params[:'peep-id'])
    redirect '/'
  end

end
