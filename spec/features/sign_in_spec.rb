feature 'Signing In' do
  before do
    User.create(name: 'Sample', email: 'sample@email.com',
      username: 'sample1235', password: 'password1234',
      password_confirmation: 'password1234')
  end

  scenario 'can sign in' do
    visit('/log_in')
    fill_in :username, with: 'sample1235'
    fill_in :password, with: 'password1234'
    within(:css, "form") do
      click_button 'Log In'
    end
    expect(page).to have_content "Sample"
  end
end