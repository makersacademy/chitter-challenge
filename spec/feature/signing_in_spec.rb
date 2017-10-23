feature 'sign in' do
  let!(:maker) do
    Maker.create(email: 'olivia@example.com',
                 password: '12345678',
                 password_confirmation: '12345678')
  end
  scenario 'with correct credentials' do
    sign_in(email: maker.email,   password: maker.password)
    expect(page).to have_content "Welcome, #{maker.email}"
  end

  scenario 'When I forget my password I can see a link to reset' do
   visit '/sessions/new'
   click_link 'Forgotten password?'
   expect(page).to have_content("Please enter your email address")
  end

 scenario 'When I enter my email I am told to check my inbox' do
   recover_password
   expect(page).to have_content "Thanks, Please check your inbox for a link."
 end

  scenario 'assigned a reset token to the user when they recover' do
    sign_up
    expect{recover_password}.to change{Maker.first.password_token}
  end

end
