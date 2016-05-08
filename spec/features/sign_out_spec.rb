feature 'Sign out' do 
  before do
    User.create(name: 'Hello',
                username: 'hello_world',
                email: 'hello@example.com',
                password: 'secret',
                password_confirmation: 'secret')
  end

  scenario 'while signed in' do
    sign_in(email: 'hello@example.com', password: 'secret')
    click_button 'Sign out'
    expect(page).to have_content "See you next time!"
    expect(page).not_to have_content "Welcome, Hello"
  end
end