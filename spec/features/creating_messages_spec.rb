feature 'Adding new messages' do
  scenario 'User can add messages on Chitter' do
    visit('/peep/new')
    fill_in('url', with: 'Testing New Message')
    
    click_button('Submit')

    expect(page).to have_content 'Testing New Message'
  end
end
