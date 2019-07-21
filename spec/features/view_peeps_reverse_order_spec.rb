# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order

feature 'See all peeps in reverse chronological order' do
  scenario 'A user can see all peeps in reverse chronological order ' do
    User.create(email: "test@example.com", password: "password123", username: "test_user")

    visit('/sessions/new')
    fill_in('email', with: "test@example.com")
    fill_in('password', with: "password123")
    click_button('Log in')
    fill_in('message', with: "Feature test peep")
    click_button('Post')
    sleep 1
    fill_in('message', with: "Another feature test peep")
    click_button('Post')
    expect(page.find('li:nth-child(1)')).to have_content 'Another feature test peep'
  end
end
