# User story 1:
# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'Post a peep' do
  scenario 'Input a message' do
    visit '/peeps/'
    click_button 'Post a new peep'
    fill_in 'peep', with: 'I just posted a peep!'
    click_button 'Send peep'
    expect(page).to have_content 'I just posted a peep!'
  end
end
