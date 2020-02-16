feature 'creating peeps' do
  scenario 'a user can post a peep to chitter' do
    # post_time = Time.new(2019, 12, 25, 12, 0, 0, "+00:00")
    # Timecop.freeze(post_time)
    User.create(username: 'testusername123', email: 'test@example.com', password: 'password123')
    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')
    visit '/peeps/new'
    fill_in('text', with: 'This is a test peep')
    click_button('Peep')
    expect(page).to have_content 'This is a test peep'
  end
end
