feature 'Creating a new message' do
  scenario do 'A user can create a new message to Chitter Messenger'
    visit('/messages/new')
    fill_in('peep', with: 'Chitter is great!')
    click_button('Submit')

    expect(page).to have_content 'Chitter is great!'
  end
end