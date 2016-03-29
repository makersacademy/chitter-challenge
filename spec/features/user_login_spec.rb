feature 'User sign up' do
  scenario 'I can sign up as a new user' do

    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, to Chitter AngryAndrew')
    expect(User.first.email).to eq('test@test.com')
  end

  scenario 'User doesn\'t get created if passwords don\'t match' do
    visit('/users/new')
    expect(page.status_code).to eq(200)
    fill_in :username, with: 'AngryAndrew'
    fill_in :email,    with: 'test@test.com'
    fill_in :password, with: 'password123'
    fill_in :password_confirmation, with: 'password124'
    expect {click_button 'Sign up'}.to change(User, :count).by(0)
    expect(page).to have_content("Password does not match the confirmation")
  end

  scenario "I can't sign up without an email address" do
    visit('/users/new')
    fill_in :username, with: 'AngryAndrew'
    fill_in :email,    with: ''
    fill_in :password, with: 'password123'
    fill_in :password_confirmation, with: 'password123'
    expect {click_button 'Sign up'}.to change(User, :count).by(0)
 end

  scenario 'User can\'t sign up with a invaild email address' do
    visit('/users/new')
    fill_in :username, with: 'AngryAndrew'
    fill_in :email,    with: 'andrew@you'
    fill_in :password, with: 'password123'
    fill_in :password_confirmation, with: 'password123'
    expect {click_button 'Sign up'}.to change(User, :count).by(0)
  end

  scenario 'I cannot sign up with an existing email' do
    sign_up
    visit('/users/new')
    fill_in :username, with: 'AngryAndrew'
    fill_in :email,    with: 'test@test.com'
    fill_in :password, with: 'password123'
    fill_in :password_confirmation, with: 'password123'
    click_button 'Sign up'
    expect(page).to have_content('Email is already taken')
  end

end
