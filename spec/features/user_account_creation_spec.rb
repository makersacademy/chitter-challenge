feature 'User account management' do
  scenario 'An unauthenticated user can create a new account and be automatically logged in' do
    expect{create_account('Chet', 'chet@chitter.com', 'the_real_chet', 'cutthechatterred2')}.to change{User.count}.by(1)
    expect(User.first.username).to eq ('the_real_chet')
    within 'header' do
      expect(page).to have_content('Welcome, Chet!')
    end
  end

  scenario 'An unauthenticated user cannot create a new account using the same email as an existing account' do
    create_account('Chet', 'chet@chitter.com', 'the_real_chet', 'cutthechatterred2')
    log_out
    create_account('Bret', 'chet@chitter.com', 'the_real_bret', 'sometimesyougottarace')
    within 'h3#alert' do
      expect(page).to have_content('Email address is registered to another account')
    end
  end

  scenario 'An unauthenticated user cannot create a new account using the same username as an existing account' do
    create_account('Chet', 'chet@chitter.com', 'the_real_chet', 'cutthechatterred2')
    log_out
    create_account('Bret', 'bret@chitter.com', 'the_real_chet', 'sometimesyougottarace')
    within 'h3#alert' do
      expect(page).to have_content('Username is already in use')
    end
  end

  scenario 'An unauthenticated user can log in to an existing account with correct details' do
    User.create(name: 'Chet', email: 'chet@chitter.com', username: 'the_real_chet', password: 'cutthechatterred2')
    log_in('the_real_chet', 'cutthechatterred2')
    within 'header' do
      expect(page).to have_content('Welcome, Chet!')
      expect(page).to have_content('Log out')
    end
  end

  scenario 'An unauthenticated user cannot log into a existing account with incorrect password' do
    User.create(name: 'Chet', email: 'chet@chitter.com', username: 'the_real_chet', password: 'cutthechatterred2')
    log_in('the_real_chet', 'sometimesyougottarace')
    within 'h3#alert' do
      expect(page).to have_content('Incorrect password')
    end
  end

  scenario 'An unauthenticated user cannot log into a non-existent account' do
    log_in('the_fake_chet', 'cutthechatterred2')
    within 'h3#alert' do
      expect(page).to have_content('User account does not exist')
    end
  end

  scenario 'An authenticated user can log out' do
    User.create(name: 'Chet', email: 'chet@chitter.com', username: 'the_real_chet', password: 'cutthechatterred2')
    log_in('the_real_chet', 'cutthechatterred2')
    log_out
    within 'header' do
      expect(page).to have_content('Welcome!')
      expect(page).to have_content('Log in')
    end
  end
end