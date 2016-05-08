feature 'User signs out' do

  let(:user) do
    User.create(name: 'Chris',
                username: 'chrischit',
                email: 'chris@email.com',
                password: 'password',
                password_confirmation: 'password')
  end

  scenario 'after they are signed in' do
    sign_in(email: user.email, password: user.password)
    click_button 'Sign out'
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content("Welcome, #{user.name}")
  end

end