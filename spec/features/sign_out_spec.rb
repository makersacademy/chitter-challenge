feature 'User can sign out' do
  scenario 'User has signed in, and then signs out' do
    sign_up
    sign_in(email:'123@test.com', password: '123test')
    click_button 'Sign out'
    expect(page).to have_content "You are now signed out...bye felicia"
    expect(current_path).to eq '/peeps'
    expect(page).not_to have_content('Hello 123 Test')
  end
end
