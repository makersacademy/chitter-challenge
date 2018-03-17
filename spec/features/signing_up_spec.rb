feature 'signing up' do
  scenario 'the user signs up' do
    visit '/'
    click_on 'Sign Up'
    username = 'Dave G. User'
    fill_in :user_name, with: username
    click_on 'Register New User'
    expect(page).to have_content "Welcome, #{username}!"
  end
  scenario 'a signed up user posts and sees their name on their tweets' do
    visit '/'
    click_on 'Sign Up'
    username = 'Dave G. User'
    fill_in :user_name, with: username
    click_on 'Register New User'
    peep_text = "This is a new peep #{rand(1.1000)}"
    fill_in :new_peep_text, with: peep_text
    click_on 'Post'
    expect(page).to have_content "Peeped by #{username}"
  end
end
