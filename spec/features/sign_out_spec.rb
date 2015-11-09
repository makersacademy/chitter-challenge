feature 'Sign out' do
  scenario 'user signs out' do
    register
    sign_in
    click_button('Sign out')
    expect(status_code).to eq 200
    expect(page).not_to have_content('Welcome, andy')
    expect(page).to have_content('You have been signed out')
  end
end