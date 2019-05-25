# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'Adding a new peep' do
  scenario 'A user can add a peep to Chitter' do

    visit('/chitter')
    fill_in('message', with: 'My first peep')
    click_button('submit')

    expect(page).to have_content 'My first peep'
  end
end
