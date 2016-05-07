feature 'Sign out' do
  scenario 'logs user out' do
    sign_up
    click_button 'Sign out'
    expect(page).to have_button('Sign in')
  end

  scenario 'doesn\'t allow user to remain signed in after log out' do
    sign_up
    click_button 'Sign out'
    visit '/home'
    expect(current_path).to eq('/')
  end
end
