feature 'user stuff' do

  scenario 'I can sign up as a new user' do
    user = build :user
    expect { sign_up(user) }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, Foo Foo ')
    expect(User.first.email).to eq('foo@bar.com')
  end

  scenario 'I cannot sign up as a new user win non-matching passwords' do
    user = build(:user,password:'wrong')
    expect { sign_up(user) }.to change(User, :count).by(0)
    expect(page).to have_content('Passwords do not match.')
  end

  scenario 'I can sign out as a user' do
    user = build :user
    sign_up(user)
    visit '/chits'
    click_button 'Sign out'
    expect(page).to have_content('Please sign in')
  end

  scenario 'I can sign in as a user' do
    user = build :user
    sign_up(user)
    visit '/chits'
    click_button 'Sign out'
    sign_in(user)
    expect(page).to have_content('Welcome, Foo Foo')
  end

  scenario 'I cannot sign in with incorrect credentials' do
    user = build(:user)
    sign_up(user)
    visit '/chits'
    click_button 'Sign out'
    user = build(:user, email:'foo@test.com')
    sign_in(user)
    expect(page).to have_content('The email or password is incorrect')

  end


end
