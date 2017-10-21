feature 'Signing up' do
  scenario 'user is able to create account' do
    sign_up "Ed Lowther", 'edlowther', 'ed@geemail.com'
    expect(page).to have_content 'Welcome to Chitter, Ed Lowther'
  end
  scenario 'user is unable to create account if email address already in data' do
    sign_up "a", 'b', 'ed@geemail.com'
    sign_up "x", 'y', 'ed@geemail.com'
    expect(page).to have_content 'We already have that email address'
  end
  scenario 'user is unable to create account if username already in data' do
    sign_up "a", 'b', 'ed@geemail.com'
    sign_up "x", 'b', 'z@geemail.com'
    expect(page).to have_content 'We already have that username'
  end
end
