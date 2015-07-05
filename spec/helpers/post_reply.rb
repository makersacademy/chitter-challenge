def post_reply(comment)
  visit '/peeps'
  fill_in :peep_reply, with: comment.peep_reply
  click_on 'reply'
end
