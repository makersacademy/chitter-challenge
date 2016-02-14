feature 'sign out' do
  scenario 'user signs out' do
    sign_up
    sign_in
    click_button 'Sign out'
    expect(page).to have_content 'You are now signed out'
    expect(page).not_to have_content 'Welcome New User'
    expect(current_path).to eq '/'
  end
end
