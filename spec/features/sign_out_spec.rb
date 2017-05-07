feature 'user can log out' do
  
  let!(:user) do
    User.create(email_address: 'user@example.com',
                user_name: 'john',
                real_name: 'John Large',
                password: 's3cr3t',
                password_confirmation: 's3cr3t')
  end

  scenario 'user signs out' do
    sign_in(email_address: user.email_address, password: user.password)
    expect(page).to have_content 'Chitter Newsfeed'
    click_on 'Sign Out'
    expect(current_path).to eq '/chitter-newsfeed'
    expect(page).to have_content 'Goodbye until next time'
    expect(page).to_not have_content "Welcome, #{user.real_name}"
  end

end
