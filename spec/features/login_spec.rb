feature 'User login' do

  let!(:user) do
    User.create(name: 'user',
                user_name: 'user123',
                email_address: 'user@user.com',
                password: 'pasword123',
                password_confirmation: 'pasword123')
  end

  scenario 'with correct credentials' do
    log_in(email_address: user.email_address, password: user.password)
    expect(page).to have_content "Hey there #{user.name}"
  end

end
