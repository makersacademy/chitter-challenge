feature 'User management' do

  email = "bob@gmail.com"
  email_new = "notbob@gmail.com"
  name = "Bob Smith"
  handle = "Bob"
  handle_new = "Not Bob"
  password = "password"
  test_peep = 'Hello there!!'
  bio = "Hi there, I'm Bob!"
  avatar = "http://an_image.png"

  before(:each) do
    sign_up(email: email, name: name, handle: handle, bio: bio, avatar: avatar, password: password)
    sign_in(email: email, password: password)
    create_peep(message: test_peep)
  end

  scenario 'new users can sign up' do
    expect(page).to have_content(handle)
    expect(User.first.email).to eq(email)
    expect(User.count).to eq(1)
  end

  scenario 'existing user can sign in' do
    expect(page).to have_content(handle)
  end

  scenario 'existing users can sign out' do
    click_button 'Sign Out'
    expect(page).to have_content('You have signed-out.')
  end

  scenario 'existing users can update their profile' do
    click_button 'Profile'
    click_button 'Update profile'
    fill_in :email,    with: email_new
    fill_in :handle,   with: handle_new
    fill_in :password, with: password
    fill_in :password_confirmation, with: password
    click_button 'Update'
    expect(page).to have_content(email_new)
    expect(page).to have_content(handle_new)
  end

  scenario "existing users can visit their profile page" do
    user = User.first
    peep = Peep.first
    visit "/users/#{user.id}"
    expect(page.status_code).to be(200)
    expect(page).to have_content(handle)
    expect(page).to have_content(email)
    expect(page).to have_content(bio)
    expect(page).to have_css("img[src*='#{avatar}']")
    expect(page).to have_content("Peep count 1")
    expect(page).to have_content("#{handle} on #{peep.date.strftime('%A, %d %b %Y')} @ #{peep.date.strftime('%l:%M %p')}")
    expect(page).to have_content("#{peep.message}")
  end

  scenario "all visitors can visit a user's profile page" do
    user = User.first
    peep = Peep.first
    sign_out
    visit "/users/#{user.id}"
    expect(page.status_code).to be(200)
    expect(page).to have_content(handle)
    expect(page).to have_content(email)
    expect(page).to have_content(bio)
    expect(page).to have_css("img[src*='#{avatar}']")
    expect(page).to have_content("Peep count 1")
    expect(page).to have_content("#{handle} on #{peep.date.strftime('%A, %d %b %Y')} @ #{peep.date.strftime('%l:%M %p')}")
    expect(page).to have_content("#{peep.message}")
  end

end
