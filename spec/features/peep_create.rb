feature 'create a peep' do
  scenario 'as a logged in user' do
    message = 'This is my message'
    sign_in
    visit '/'
    fill_in 'peep_new_message', with: message
    click_button 'Peep!'
    expect(page).to have_content message
  end
end
