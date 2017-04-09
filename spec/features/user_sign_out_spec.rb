feature 'User signs out' do

  before(:each) do
    User.create(email: 'cat@cat.com',
                username: 'cat',
                password: 'cat',
                password_confirmation: 'cat')
  end

  scenario 'while being signed in' do
    sign_in(username: 'cat', password: 'cat')
    click_button 'Sign out'
    expect(page).to have_content('Bye Bye Kitty!')
    expect(page).not_to have_content('Welcome cat')
  end
end
