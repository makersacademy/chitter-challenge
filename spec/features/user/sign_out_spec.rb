feature 'Sign out' do
  scenario 'removes the sign in information from the browser session' do
    sign_up
    sign_in
    click_button('Sign out')
    require 'byebug'
    byebug
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content('Welcome, kj')
  end
end
