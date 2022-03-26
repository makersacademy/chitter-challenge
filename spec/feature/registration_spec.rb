
feature 'Registration' do
  scenario 'user can sign up' do
    visit 'users/new'
    fill_in 'name', with: 'Samuel'
    fill_in 'username', with: 'samuelmbp'
    fill_in 'email', with: 'samuel@example.com'
    fill_in 'password', with: 'test1234'
    click_on 'Register'

    expect(page).to have_content 'Welcome, samuel@example.com'
  end
end