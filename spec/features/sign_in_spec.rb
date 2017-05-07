feature 'user can log in' do

  let!(:user) do
    User.create(email_address: 'user@example.com',
                user_name: 'john',
                real_name: 'John Large',
                password: 's3cr3t',
                password_confirmation: 's3cr3t')
  end

  scenario 'user enters correct login details' do
    sign_in(email_address: user.email_address, password: user.password)
    expect(current_path).to eq '/chitter-newsfeed'
    expect(page).to have_content "Welcome, #{user.real_name}"
  end

  scenario 'user enters wrong login details' do
    sign_in(email: user.email_address, password: 'wrong_password')
    expect(current_path).to eq '/sessions'
    expect(page).to have_content 'The email or password is incorrect'
  end

end
