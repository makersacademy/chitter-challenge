# 1. As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'a message can be posted to chitter' do

  scenario 'a user can add a peep' do
    message = 'I am a new peep!'
    visit '/'
    fill_in 'peep', with: message
    click_button 'Submit'
    expect(page).to have_content message
  end

end