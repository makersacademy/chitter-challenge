feature 'Peeps:' do
  scenario 'any user can see all peep messages' do
    create_account('Test', 'TestUser', 'test@mail.me', 'Password')
    user = User.all.last
    write_new_peep('hello world')
    expect(page).to have_content('TestUser')
    expect(page).to have_content('hello world')
  end

  scenario 'each peep has a time & date stamp' do
    create_account('Test', 'mrtest', 'test@test.uk', 'Testing')
    write_new_peep('What is the time?')
    time = Time.new.strftime("%H:%M")
    date = Time.new.strftime("%a-%d-%b-%Y")
    expect(page).to have_content(time)
    expect(page).to have_content(date)
  end

  scenario 'user has option to sign up, if they are not signed in already' do
    visit('/')
    expect(page).to have_button('Sign Up')
    click_button('Sign Up')
    expect(page.current_url.ends_in?('/users/new')).to be(true)
  end

  scenario 'user has option to sign in, if they are not signed in already' do
    visit('/')
    expect(page).to have_button('Sign In')
    click_button('Sign In')
    expect(page.current_url.ends_in?('/users/sign_in')).to be(true)
  end


  scenario 'if a user is signed in, there is a button taking them to the new peep page' do
    create_account('Tom', 'trmoir', 'tom@mail.me', 'Password')
    expect(page).to have_button('New Peep')
    click_button('New Peep')
    expect(page.current_url.ends_in?('/peeps/new')).to be(true)
  end
end
