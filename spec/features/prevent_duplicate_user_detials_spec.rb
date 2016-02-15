
feature 'Preventing duplicate user details' do

  scenario 'A user signing up with an existing username' do

    sign_up(name: 'Steve', username: 'seanh', email: 'steve@s.com')
    sign_up(name: 'Sean', username: 'seanh', email: 's@s.com')
    expect(page).to have_current_path('/users')
    expect(page).to have_content('Username is already taken')

  end

  scenario 'A user signing up with an existing password' do

    sign_up(name: 'Steve', username: 'steveh', email: 's@s.com')
    sign_up(name: 'Sean', username: 'seanh', email: 's@s.com')
    expect(page).to have_current_path('/users')
    expect(page).to have_content('Email is already taken')

  end

end
