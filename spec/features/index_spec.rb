feature 'View Homepage' do
  scenario 'User visits hompage' do
    visit('/')
    expect(page).to have_content('Welcome to Chitter')
    click_button('Sign Up')
  end
end
