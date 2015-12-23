# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter
feature 'Post message' do
  xscenario 'after signing up' do
    sign_up
    click_button 'takes user from sign up confirmation to posting a message'
  end

end
