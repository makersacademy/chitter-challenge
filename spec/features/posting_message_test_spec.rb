# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'Messaging feed - Basic navigation' do
  scenario 'can access chitter feed from home page without login or sign up' do
    visit '/'
    find('#panel').click
    click_link 'Message feed'
    expect(page).to have_current_path '/chitter/feed'
  end

  scenario 'can return to the home page from the feed' do
    visit '/'
    find('#panel').click
    click_link 'Message feed'
    click_link 'Home'
    expect(page).to have_current_path '/chitter'
  end
end

feature 'Messaging - without sign up or login' do
  scenario 'inaccessible from home unless signed up or logged in' do
    visit '/'
    find('#panel').click
    click_link 'Post a message'
    expect(page).to have_content("You have to be signed in to post a message.")
  end

  scenario 'inaccessible from feed unless signed up or logged in' do
    visit '/'
    find('#panel').click
    click_link 'Message feed'
    find('#panel').click
    click_link 'Post a message'
    expect(page).to have_content("You have to be signed in to post a message.")
  end
end

feature 'Messaging - Directly after sign up' do

  scenario 'can access messaging page from home page' do
    visit '/'
    click_button "Sign up"
    sign_up
    visit '/'
    find('#panel').click
    click_link 'Post a message'
    expect(page).to have_current_path '/chitter/messaging'
  end

  scenario 'messages can be posted to Chitter feed' do
    visit '/'
    click_button "Sign up"
    sign_up
    visit '/'
    find('#panel').click
    click_link 'Post a message'
    fill_in "message", with: "some random message"
    click_button "Submit"
    find('#panel').click
    click_link 'Post a message'
    fill_in "message", with: "another random message"
    click_button "Submit"
    expect(page).to have_content "some random message"
    expect(page).to have_content "another random message"
  end

  scenario 'can go to messages from the feed' do
    visit '/'
    click_button "Sign up"
    sign_up
    visit '/'
    find('#panel').click
    click_link 'Message feed'
    find('#panel').click
    click_link 'Post a message'
    expect(page).to have_current_path '/chitter/messaging'
  end
end

feature 'Messaging - After login' do
  before 'test' do
    visit '/'
    click_button "Sign up"
    sign_up
    find('#panel').click
    click_link 'Log out'
  end

  scenario 'can access messaging page from home page' do
    login
    visit '/'
    find('#panel').click
    click_link 'Post a message'
    expect(page).to have_current_path '/chitter/messaging'
  end

  scenario 'messages can be posted to Chitter feed' do
    login
    visit '/'
    find('#panel').click
    click_link 'Post a message'
    fill_in "message", with: "some random message"
    click_button "Submit"
    find('#panel').click
    click_link 'Post a message'
    fill_in "message", with: "another random message"
    click_button "Submit"
    expect(page).to have_content "some random message"
    expect(page).to have_content "another random message"
  end

  scenario 'can go to messages from the feed' do
    login
    visit '/'
    find('#panel').click
    click_link 'Message feed'
    find('#panel').click
    click_link 'Post a message'
    expect(page).to have_current_path '/chitter/messaging'
  end
end

feature 'Messaging - functionality' do

# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order

  scenario 'peeps can be sorted into descending order' do
    visit '/'
    click_button "Sign up"
    sign_up
    visit '/'
    find('#panel').click
    click_link 'Post a message'
    fill_in "message", with: "some random message"
    click_button "Submit"
    find('#newest', :visible => false).click
    click_button "Sort"

    expect(page.first('div')).to have_content "some random message"
  end

# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

  scenario 'message contains the time it was posted' do
    visit '/'
    click_button "Sign up"
    sign_up
    visit '/'
    find('#panel').click
    click_link 'Post a message'
    fill_in "message", with: "some random message"
    click_button "Submit"
    time = Time.now
    expect(page).to have_content time.strftime("%Y-%m-%d %H:%M")
  end
end
