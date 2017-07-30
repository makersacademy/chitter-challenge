feature 'user can sign out' do
  before(:each) do
    User.create(email: 'example@example.com',
                  password: 'example',
                  password_confirmation: 'example')
  end
  scenario 'when user is signed in, they can sign out' do
    sign_in(email: 'example@example.com', password: 'example')
    click_button 'Sign out'
    expect(page).to have_content 'You are signed out'
    expect(page).not_to have_content 'Welcome to Chitter, example@example.com'
  end
end
