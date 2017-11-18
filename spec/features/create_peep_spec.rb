# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'Create a peep' do
  scenario 'User can post a peep to chitter' do
    visit('/home')

    fill_in 'new_peep_box', with: 'Hello World, this is my peep!'
    click_on('Create Peep')

    expect(page.status_code).to eq 200
    expect(page).to have_content('Hello World, this is my peep!')
  end
end
