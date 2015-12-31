feature 'user sign out' do

  let(:user) do
    User.create(name: 'Edward Kerry',
                user_name: 'Edward',
                email: 'edwardkerry@gmail.com',
                password: 'password123',
                password_confirmation: 'password123')
  end

  scenario 'users may sign out' do
    sign_in(email: user.email, password: user.password)
    click_button 'Sign Out'
    expect(page).to have_content 'Goodbye'
    expect(page).to have_content 'Welcome to Chitter'
  end
end
