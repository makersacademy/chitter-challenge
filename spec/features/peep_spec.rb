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

  scenario 'Peeps appear in reverse chronological order' do
    visit('/home')
    message1 = 'Hello World, this is my peep!'
    message2 = 'Hi, this is my second peep!'

    fill_in 'new_peep_box', with: message1
    click_on('Create Peep')

    fill_in 'new_peep_box', with: 'Hi, this is my second peep!'
    click_on('Create Peep')

    expect(message2).to appear_before(message1)
  end
end
