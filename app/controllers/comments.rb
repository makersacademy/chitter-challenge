class ChitterChallenge < Sinatra::Base

  post '/comments/new' do
    #peep.id = xxx          # Need the peep object from which the "add a comment" button was clicked.
    comment = Comment.create(message: params['comment_ta'])
    #peep.comments << comment
    # Currently the comment_peeps table is not being populated with values.
    redirect '/peeps'
  end
  
end
