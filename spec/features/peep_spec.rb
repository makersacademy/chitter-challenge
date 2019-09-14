# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'peep' do
  scenario 'Maker wants to post a peep' do
    visit ('/postapeep')
    fill_in 'peep' , with: "Hello Makers!"
    click_button 'Send peep'

    expect(page).to have_content("Hello Makers")
  end
end
