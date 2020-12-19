feature 'So that I can let people know what I am doing,' do
  scenario 'I want to post a message (peep) to chitter' do
    visit('/peeps/new')
    fill_in('message', with: 'Test message')
    click_button('Peep')
    expect(page).to_not have_content 'Sinatra'
    expect(page).to have_content('Test message')
  end
end
