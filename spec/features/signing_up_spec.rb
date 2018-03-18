feature 'signing up' do
  scenario 'the user signs up' do
    visit '/'
    click_on 'Sign Up'

    name = 'Dave G. User'
    username = 'Erotic Dave'
    email = 'dave@googlemail.com'
    password = 'password'

    fill_in :fullname, with: name
    fill_in :username, with: username
    fill_in :email, with: username
    fill_in :password, with: password
    click_on 'Register New User'
    expect(page).to have_content "Welcome, #{username}!"
    expect(page).not_to have_content "Welcome, anonymous!"
  end
  scenario 'a signed up user posts and sees their name on their tweets' do
    visit '/'
    click_on 'Sign Up'

    name = 'Dave G. User'
    username = 'Erotic Dave'
    email = 'dave@googlemail.com'
    password = 'password'
    peep_text = "This is a new peep #{rand(1.1000)}"

    fill_in :fullname, with: name
    fill_in :username, with: username
    fill_in :email, with: username
    fill_in :password, with: password
    click_on 'Register New User'
    fill_in :new_peep_text, with: peep_text
    click_on 'Post'
    expect(page).to have_content "Peeped by #{username}"
  end
end
