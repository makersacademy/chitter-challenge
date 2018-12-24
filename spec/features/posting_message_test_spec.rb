# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'Chitter messaging' do

  scenario 'can access messaging page from home page' do
    visit '/'
    click_button "Sign up"
    sign_up
    visit '/'
    click_link 'Post a Peep'
    expect(page).to have_current_path '/chitter/messaging'
  end

  scenario 'can access chitter feed from home page' do
    visit '/'
    click_link 'Feed'
    expect(page).to have_current_path '/chitter/feed'
  end

  scenario 'message can be posted to Chitter feed' do
    visit '/'
    click_button "Sign up"
    sign_up
    visit '/'
    click_link 'Post a Peep'
    fill_in "message", with: "some random message"
    click_button "Submit"
    click_link 'Post a Peep'
    fill_in "message", with: "another random message"
    click_button "Submit"

    # expect(page.first('div')).to_not have_content "some random message"
    expect(page).to have_content "another random message"
  end

  scenario 'can access chitter feed from home page' do
    visit '/'
    click_link 'Feed'
    expect(page).to have_current_path '/chitter/feed'
  end

  scenario 'can go to messages from the feed' do
    visit '/'
    click_button "Sign up"
    sign_up
    visit '/'
    click_link 'Feed'
    click_link 'Post a Peep'
    expect(page).to have_current_path '/chitter/messaging'
  end

  scenario 'can return to the home page from the feed' do
    visit '/'
    click_link 'Feed'
    click_link 'Home'
    expect(page).to have_current_path '/chitter'
  end
# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order

  scenario 'peeps can be sorted into descending order' do
    visit '/'
    click_button "Sign up"
    sign_up
    visit '/'
    click_link 'Post a Peep'
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
    click_link 'Post a Peep'
    fill_in "message", with: "some random message"
    click_button "Submit"
    time = Time.now
    expect(page).to have_content time.strftime("%Y-%m-%d %H:%M")
  end
end
