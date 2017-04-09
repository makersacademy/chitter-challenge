feature 'User signs out' do

  let!(:user) do
    User.create(email: 'cat@cat.com',
                name: 'saucy cat',
                username: 'cat',
                password: 'cat',
                password_confirmation: 'cat')
  end

  scenario 'while being signed in' do
    sign_in(username: user.username, password: user.password)
    click_button 'Sign out'
    expect(page).to have_content('Bye Bye Kitty!')
    expect(page).not_to have_content('Welcome cat')
  end
end
