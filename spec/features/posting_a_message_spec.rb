feature 'post a chit' do

  let!(:user) do
    User.create(email_address: 'user@example.com',
                user_name: 'john',
                real_name: 'John Large',
                password: 's3cr3t',
                password_confirmation: 's3cr3t')
  end

  scenario 'user signs in and submits post' do
    sign_in(email_address: user.email_address, password: user.password)
    fill_in 'message_content', with: "Hello, world!"
    click_on('Submit')
    within 'ul#posts' do
      expect(page).to have_content "Hello, world!"
      expect(page).to have_content "@john"
    end
  end

end
