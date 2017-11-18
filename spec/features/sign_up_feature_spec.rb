feature 'sign up' do
  scenario 'user can click sign up button and be sent to sign up page' do
    visit('/')
    click_button('Sign Up')
    expect(page).to have_content('Sign up for Chitter and connect with Peeps!')
  end
end
