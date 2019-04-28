# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'posting a message' do
  scenario 'user posts a message on the page' do
    sign_up
    peep
    expect(page).to have_content 'Hello World'
  end
end

# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order

feature 'seeing all peeps in reverse chronological order' do
  scenario 'visit posts page and seeing the last one at the top' do
    sign_up
    peep
    peep_2
    expect(page).to have_content 'World Hello'
    expect(page).to have_content 'Hello World'
  end
end

# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

feature 'seeing all peeps in reverse chronological order' do
  scenario 'visit posts page and seeing the last one at the top' do
    sign_up
    peep
    expect(page).to have_content 'Hello World created at'
  end
end

# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'sign up to chitter with an unique email, password, name and a username' do
  scenario 'signing up and peeping' do
    sign_up
    peep
    expect(page).to have_content 'posted by guiheurich'
  end
end
