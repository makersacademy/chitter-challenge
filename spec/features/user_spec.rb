feature 'User' do
  let(:email) { 'user@user.com' }
  let(:password) { '123' }

  scenario 'Sign up' do
    visit('/user/new')
    fill_in 'email', with: email
    fill_in 'password', with: password
    fill_in 'password_confirmation', with: password
    click_button 'Sign Up'
    expect(page).to have_content("Howdy #{email}")
  end
end
