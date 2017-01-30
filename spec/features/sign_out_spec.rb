feature 'User signs out' do

  before(:each) do
    User.create(email: 'user@example.com',
                username: 'johndoe',
                name: 'John Doe',
                password: 'secret1234',
                password_confirmation: 'secret1234')
  end

  scenario 'while being signed in' do
    sign_in(email: 'test@test.com', password: 'secret1234')
    click_button 'Sign out'
    expect(page).not_to have_content("Welcome, johndoe")
  end

end
