# As a Maker
# So that I can post messages on Chitter as me
# I want to log in to Chitter

feature 'Sign in' do
  let(:user) do
    User.create(name: 'Michael H',
                email: 'test@chitter.com',
                handle: 'mikeh91',
                password: 'password',
                password_confirmation: 'password')
  end

  scenario 'signing in logs the user in' do
    sign_in(email: user.email, password: user.password)
    expect(current_path).to eq "/users/#{user.handle}"
    expect(page).to have_content "#{user.name}"
    expect(page).to have_selector("input[type=submit][value='Sign out']")
    expect(page).not_to have_selector("input[type=submit][value='Sign in']")
  end

  scenario 'incorrect email does not allow login' do
    sign_in(email: 'wrong@email.com', password: user.password)
    expect(current_path).to eq '/'
    expect(page).to have_selector("input[type=submit][value='Sign in']")
    expect(page).not_to have_selector("input[type=submit][value='Sign out']")
  end

  scenario 'incorrect password does not allow login' do
    sign_in(email: user.email, password: 'wrong')
    expect(current_path).to eq '/'
    expect(page).to have_selector("input[type=submit][value='Sign in']")
    expect(page).not_to have_selector("input[type=submit][value='Sign out']")
  end
end