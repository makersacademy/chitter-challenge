feature 'User sign in' do
  scenario 'While being signed in I can sign out' do
    create_user
    sign_in
    click_button 'Sign out'
    expect(current_path).to eq '/'
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content('Welcome, Sarah')
  end
end
