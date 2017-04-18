feature 'User sign in' do

  let!(:user) do
    User.create(email: 'ruan@email.com',
                password: 's3cr3t',
                password_confirmation: 's3cr3t',
                name: 'Ruan',
                user_name: 'ruan')
  end

  scenario 'successful sign in' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome, #{user.user_name}"
  end

  scenario 'unsuccessful sign in' do
    sign_up
    sign_in(password: 'incorrect')
    expect(current_path).to eq '/sessions'
    expect(page).to have_content 'The email or password is incorrect'
  end

  scenario 'should have the ability to sign in from home' do
    visit '/peeps'
    expect(page).to have_selector(:link_or_button, 'Log in')
  end
end
