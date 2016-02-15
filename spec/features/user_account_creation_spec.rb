feature 'User account management' do
<<<<<<< HEAD
  scenario 'An unauthenticated user can create a new account and be automatically logged in' do
    expect{create_account('chet', 'cutthechatterred2')}.to change{User.count}.by(1)
    expect(User.first.username).to eq ('chet')
    within 'header' do
=======
  scenario 'User can create a new account and automatically get logged in' do
    expect{create_account}.to change{User.count}.by(1)
    expect(User.first.username).to eq ('chet')
    within 'article#header' do
>>>>>>> 2d2b367b2fb71cd937686a9df489814059793285
      expect(page).to have_content('Welcome, chet!')
    end
  end

<<<<<<< HEAD
  scenario 'An unauthenticated user can log in to an existing account with correct details' do
    User.create(username: 'chet', password: 'cutthechatterred2')
    log_in('chet', 'cutthechatterred2')
    within 'header' do
      expect(page).to have_content('Welcome, chet!')
      expect(page).to have_content('Log out')
    end
  end

  scenario 'An unauthenticated user cannot log into a existing account with incorrect password' do
    User.create(username: 'chet', password: 'cutthechatterred2')
    log_in('chet', 'sometimesyougottarace')
    within 'h3#alert' do
      expect(page).to have_content('Incorrect password!')
    end
  end

  scenario 'An unauthenticated user cannot log into a non-existent account' do
    log_in('chet', 'cutthechatterred2')
    within 'h3#alert' do
      expect(page).to have_content('User account does not exist!')
    end
  end

  scenario 'An authenticated user can log out' do
    User.create(username: 'chet', password: 'cutthechatterred2')
    log_in('chet', 'cutthechatterred2')
    puts "Successfully logged in! Path: #{current_path}"
    log_out
    within 'header' do
      expect(page).to have_content('Welcome!')
      expect(page).to have_content('Log in')
=======
  scenario 'An unauthenticated user can log in with correct details' do
    User.create(username: 'chet', password: 'cutthechatterred2')
    log_in
    within 'article#header' do
      expect(page).to have_content('Welcome, chet!')
      expect(page).to have_content('Log out')
>>>>>>> 2d2b367b2fb71cd937686a9df489814059793285
    end
  end
end