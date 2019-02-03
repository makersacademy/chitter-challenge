# 1. As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'a message can be posted to chitter' do

  scenario 'a user can add a peep' do
    create_user
    valid_login
    post_one_message
    expect(page).to have_content 'I am a new peep!'
  end

end
