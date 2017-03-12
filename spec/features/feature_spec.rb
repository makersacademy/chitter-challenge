# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'sign up' do
  scenario 'there is a sign up button on the homepage' do
    visit '/'
    expect(page).to have_button "Sign Up"
  end

  scenario 'i can sign up with a username and password' do
    sign_up
    expect(page).to have_content "Welcome to Chitter, John."
  end

  scenario 'i cannot sign up without a username' do
    visit '/'
    fill_in('password', with: 'password123')
    click_button "Sign Up"
    expect(page).to have_content "You must enter a username."
  end

  scenario 'i cannot sign up twice with the same username' do
    sign_up
    click_link "log-out"
    sign_up
    expect(page).to have_content "That username is taken. Please try another."
  end

  scenario 'i am prompted to verify my email and name once I have signed up' do
    sign_up
    expect(page).to have_content "Please enter your email address and first name to confirm your account."
  end

end

# As a Maker
# So that I can post messages on Chitter as me
# I want to log in to Chitter

feature 'log in' do
  scenario 'there is a log in button on the homepage' do
    visit '/'
    expect(page).to have_button "Log In"
  end

  scenario 'i can log in with a username and password' do
    sign_up
    click_link "log-out"
    log_in
    expect(page).to have_content "Welcome to Chitter, John."
  end
end

# As a Maker
# So that I can avoid others posting messages on Chitter as me
# I want to log out of Chitter

feature 'log out' do
  scenario 'there is a log out button on the feed page' do
    sign_up
    expect(page).to have_link "log-out"
  end

  scenario 'i can log out' do
    sign_up
    click_link "log-out"
    expect(page).not_to have_content "Welcome to Chitter, John."
    expect(page).to have_content "You have been logged out."
  end
end

# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'post peep' do
  scenario 'there is a button on the feed page for posting a peep' do
    sign_up
    verify
    expect(page).to have_button "post-peep"
  end
  scenario 'i can post a peep' do
    sign_up_verify_and_peep
    expect(page).to have_content "Hello World"
  end
end

# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order

feature 'see peeps' do
  scenario 'i can see all peeps in reverse chronological order' do
    sign_up_verify_and_peep # Hello World
    peep_again # Hello Again
    expect(page).to have_text(/Hello Again.+Hello World/) # Hello Again before Hello World
  end
end

# As a maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

feature 'peep date and time' do
  scenario 'i can see the date and time of a peep' do
    sign_up_verify_and_peep
    expect(page).to have_content "#{Time.now.strftime("%e-%m-%y %H:%M")}"
  end
end

# extra credit

feature 'replies' do
  scenario 'i can reply to a peep' do
    sign_up_verify_and_peep
    fill_in('reply_body', with: "Cool Peep")
    click_button 'post-reply'
    expect(page).to have_content "Cool Peep"
  end
end
