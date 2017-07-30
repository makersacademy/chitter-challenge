feature 'User: sign out' do

  before(:each) do
    User.create(email: 'test@test.com',
                password: 'test',
                password_confirmation: 'test')
  end

  scenario 'whilst signed in' do
    sign_in(email: 'test@test.com', password: 'test')
    click_button 'Sign out'
    expect(page).to have_content 'So long'
    expect(page).not_to have_content 'Welcome, user@user.com'
  end
end
