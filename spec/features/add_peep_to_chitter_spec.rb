feature 'Adding peeps to the chitter' do
  scenario 'A user can add a message to the database' do
    sign_in_and_chatter
    fill_in 'message', with: 'Henlo World'
    click_button 'post'
    expect(page).to have_content 'Henlo World'
  end
end
