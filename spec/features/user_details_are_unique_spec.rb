feature 'User is Unique' do
  scenario 'user cannot signup with the same details again' do
    register
    click_button 'Log Out'
    click_button 'Sign Up'
    register
    expect(current_path).to eq '/users/register'
    expect(page).to have_content 'The username or email provided is already in use. Please try again.'
  end
end
