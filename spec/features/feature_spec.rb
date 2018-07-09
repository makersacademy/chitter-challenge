# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

# feature 'posting peeps' do
#   scenario 'user is able to post a new peep' do
#     visit('/peep/new')
#     fill_in('content', with: "Let the Galaxy burn!")
#     click_button('Publish')
#     expect(page).to have_content("Let the Galaxy burn!")
#   end
# end

# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order

# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

# feature 'peep timeline' do
#   scenario 'peeps are arranged in reverse chronological order' do
#     visit('/')
#   end
#   scenario 'user is able to see the time at which a peep was created' do
#     visit('/')
#   end
# end

# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'user registration' do
  scenario 'user is able to sign up to Chitter' do
    visit('/')
    click_button('Sign Up')
    fill_in('username', with: 'horus')
    fill_in('name', with: 'Horus Lupercal')
    fill_in('email', with: 'test@test.com')
    fill_in('password', with: 'password1')
    click_button('Submit')
    expect(page).to have_text('Horus Lupercal')
  end
end

# As a Maker
# So that only I can post messages on Chitter as me
# I want to log in to Chitter

feature 'logging in' do
  scenario 'user is able to log in to Chitter' do
    User.create('horus', 'Horus Lupercal', 'test@test.com', 'password123')
    visit('/sessions/new')
    fill_in('sign_in_email', with: 'test@test.com')
    fill_in('sign_in_password', with: 'password123')
    click_button('Sign in')
    expect(page).to have_content('Hello, Horus Lupercal')
  end
end

# As a Maker
# So that I can avoid others posting messages on Chitter as me
# I want to log out of Chitter

# As a Maker
# So that I can stay constantly tapped in to the shouty box of Chitter
# I want to receive an email if I am tagged in a Peep
