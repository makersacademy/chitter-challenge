feature 'Viewing Peeps' do

  let!(:user) do
    User.create(email: 'cr7@example.com',
                firstname: 'cristiano',
                lastname: 'runaldo',
                username: 'cr8',
                password: 'password123',
                password_confirmation: 'password123')
  end

  scenario 'I can see peeps on the peeps page' do
    sign_in(email: user.email,   password: user.password)
    post_peep
    visit '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content('test')
    end
  end

  scenario 'I want to see the time a peep was made' do
    Timecop.freeze(Time.parse("2017-07-02 19:53:35 +0100"))
    sign_in(email: user.email,   password: user.password)
    post_peep
    visit '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content("2017-07-02T19:53:35+01:00")
    end
  end
end
