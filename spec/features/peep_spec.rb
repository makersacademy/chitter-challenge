# as a maker so that i can let
# people know what i am doing
# i wanr to post a message to chitter

feature 'post peep' do

  scenario 'Maker wants to post a peep' do
    visit('/postapeep')
    fill_in 'peep', with: "Hello Chitter!"
    click_button 'Send peep'

    expect(page).to have_content("Hello Chitter!")
  end
end
