# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'posting peeps' do
  scenario 'user is able to post a new peep' do
    sign_in_as_user
    visit '/peeps/new'
    fill_in('content', with: "Let the Galaxy burn!")
    click_button 'Publish'
    expect(page).to have_content("Let the Galaxy burn!")
  end
end

# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order

# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

# feature 'peep timeline' do
#   scenario 'peeps are arranged in reverse chronological order' do
#     multiple_posts
#     visit('/peeps')
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
    visit '/users/new'
    fill_in('username', with: 'horus')
    fill_in('name', with: 'Horus Lupercal')
    fill_in('email', with: 'warmaster@great-crusade.org')
    fill_in('password', with: 'vengefulspirit')
    click_button('Submit')

    expect(page).to have_text('Signed in as Horus Lupercal')
  end
end

# As a Maker
# So that only I can post messages on Chitter as me
# I want to log in to Chitter

feature 'logging in' do
  scenario 'user is able to log in to Chitter' do
    User.create('horus', 'Horus Lupercal', 'warmaster@great-crusade.org', 'vengefulspirit')

    visit '/sessions/new'
    fill_in('sign_in_email', with: 'warmaster@great-crusade.org')
    fill_in('sign_in_password', with: 'vengefulspirit')
    click_button('Sign In')

    expect(page).to have_content('Signed in as Horus Lupercal')
  end
  scenario 'users who have not logged in are unable to publish new peeps' do
    visit '/peeps/new'
    expect(page).to have_content('Log in to Chitter')
  end
end

# As a Maker
# So that I can avoid others posting messages on Chitter as me
# I want to log out of Chitter

feature 'logging out' do
  scenario 'user is able to terminate their Chitter session' do
    User.create('horus', 'Horus Lupercal', 'warmaster@great-crusade.org', 'vengefulspirit')

    visit '/sessions/new'
    fill_in('sign_in_email', with: 'warmaster@great-crusade.org')
    fill_in('sign_in_password', with: 'vengefulspirit')
    click_button('Sign In')
    visit '/sessions/destroy'

    expect(page).to_not have_content('Signed in as Horus Lupercal')
  end
end

# As a Maker
# So that I can stay constantly tapped in to the shouty box of Chitter
# I want to receive an email if I am tagged in a Peep
