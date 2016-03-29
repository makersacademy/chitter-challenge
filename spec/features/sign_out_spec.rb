feature 'User signs out' do
  include Helpers

  scenario 'while being signed in' do
    sign_up
    sign_in
    click_button 'Sign out'
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content("Welcome to Chitter, ghost!")
  end
end
