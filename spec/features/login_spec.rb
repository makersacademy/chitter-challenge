feature "Log in" do
  scenario "When a user uses the same password and email address as on their record they can sign in" do
    User.create(email: 'fake1@fake.com', password: 'password')
    login
    expect(page). to have_content "Welcome, fake1@fake.com"
  end
  scenario "When a user uses the same password and email address as on their record they can sign in and add a peep" do
    User.create(email: 'fake1@fake.com', password: 'password')
    login
    click_button 'peep'
    fill_in 'content', with: 'Today is great'
    click_button 'submit'
    expect(page).to have_content "Content: Today is great Time: #{Time.new} By: fake1@fake.com"
  end

  scenario "When a user uses a different password and same email address as on their record they can't sign in" do
    User.create(email: 'fake1@fake.com', password: 'password')
    visit '/'
    fill_in 'email', with: 'fake1@fake.com'
    fill_in 'password', with: 'password123'
    click_button 'login'
    expect(page). to have_content "Please Sign up"
  end
end
