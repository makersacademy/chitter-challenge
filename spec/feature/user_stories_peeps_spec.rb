require 'time'
# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter
feature 'posting peeps' do
  scenario 'an authenticated user can post peeps on chitter' do
    user = User.create(email: 'think@yahoo.com', password: 'secret', name: 'Zelda', username: 'dog')
    Peeps.create(peep: 'First peep',user_id: user.id)
    visit('/peeps')
    expect(page).to have_content('First peep')
  end
end


feature 'seeing all peeps' do
  before do
    user = User.create(email: 'think@yahoo.com', password: 'secret', name: 'Zelda', username: 'dog')
    Peeps.create(peep: 'First peep', user_id: user.id)
    Peeps.create(peep: 'Second peep', user_id: user.id)
    Peeps.create(peep: 'Third peep', user_id: user.id)
    visit('/peeps')
  end

  # As a maker
  # So that I can see what others are saying
  # I want to see all peeps in reverse chronological order
  scenario 'a user can see all the peeps in reverse chronological order' do
    # expect(first(".peep")).to have_content('Third peep')
    expect(page.text.index('Third peep')).to be < page.text.index('Second peep')
  end

  # As a Maker
  # So that I can better appreciate the context of a peep
  # I want to see the time at which it was made
  scenario 'seeing the time that the peep was made' do
    user = User.create(email: 'think@yahoo.com', password: 'secret', name: 'Zelda', username: 'dog')
    peep4 = Peeps.create(peep: 'Fourth peep', user_id: user.id)
    expect(page).to have_content peep4.time.strftime("at %H:%M")
  end
end

# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter
feature 'Signing up to Chitter' do
  scenario 'you need to sign up to post peeps' do
    visit('/')
    click_button('Sign up')
    fill_in('email', with: 'whatever@gmail.com')
    fill_in('password', with: 'secret')
    fill_in('name', with: 'Glykeria')
    fill_in('username', with: 'Glykify')
    click_button('Submit')

    expect(current_path).to have_content('/peeps')
    # expect(page).to have_content('Glykify')
  end
end

# As a Maker
# So that only I can post messages on Chitter as me
# I want to log in to Chitter
feature 'Logging in to Chitter' do
  scenario 'so that you can post peeps as you, you need to log in' do
    user = User.create(email: 'think@yahoo.com', password: 'secret', name: 'Zelda', username: 'dog')
    visit('/')
    click_button('Log in')
    fill_in('email', with: 'think@yahoo.com')
    fill_in('password', with: 'secret')
    click_button('Submit')

    expect(current_path).to have_content('/peeps')
  end
end

# As a Maker
# So that I can avoid others posting messages on Chitter as me
# I want to log out of Chitter
feature 'Logging out of Chitter' do
  scenario 'so that no one posts as me, I want to log out' do
    user = User.create(email: 'think@yahoo.com', password: 'secret', name: 'Zelda', username: 'dog')
    visit('/')
    click_button('Log in')
    fill_in('email', with: 'think@yahoo.com')
    fill_in('password', with: 'secret')
    click_button('Submit')

    expect(current_path).to have_content('/peeps')

    click_button('Log out')
    expect(current_path).to have_content('/sessions/end')
    expect(page).to have_content("You have logged out of Chitter.")
  end
end
