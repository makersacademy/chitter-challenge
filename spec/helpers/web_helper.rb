module SessionHelpers

def post_new_message
  visit '/messages/new'
  fill_in 'user_name', with: 'Nikolaos'
  fill_in 'message', with: 'MA Chitter is a cool app - 1'
  click_button 'Peep'
end

def post_other_message
  Message.create(message: 'MA Chitter kicks Twitter A@@! - 2', created_at: Time.now + 60 )
  visit '/messages'
end

end
