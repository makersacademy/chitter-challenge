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
    visit '/'
    within 'form#sign_in' do
      fill_in(:email, with: user.email)
      fill_in(:pwd, with: user.password)
      click_button 'Sign in'
    end

    expect(current_path).to eq "/users/#{user.handle}"
    expect(page).to have_content "#{user.name}"
  end

  scenario 'incorrect email does not allow login' do
    visit '/'
    within 'form#sign_in' do
      fill_in(:email, with: 'wrong@email.com')
      fill_in(:pwd, with: user.password)
      click_button 'Sign in'
    end

    expect(current_path).to eq '/'
  end

  scenario 'incorrect password does not allow login' do
    visit '/'
    within 'form#sign_in' do
      fill_in(:email, with: user.email)
      fill_in(:pwd, with: 'wrong')
      click_button 'Sign in'
    end

    expect(current_path).to eq '/'
  end
end