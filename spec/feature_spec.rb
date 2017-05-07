feature 'Homepage' do

  scenario 'land on homepage' do
    DatabaseCleaner.clean
    sign_up_2_users
    bunch_of_peeps
    visit '/'
    expect(page).to have_content 'chitter'
  end

  scenario 'see peeps' do
    visit '/'
    expect(page).to have_content 'handle'
  end

  scenario 'see avatars' do
    visit '/'
    page.should have_xpath("//img[@src=\"egg.png\"]")
  end

  scenario 'see peeps' do
    visit '/'
    expect(page).to have_content 'practice peep'
  end
end

feature 'User accounts' do
  scenario 'go to sign in' do
    visit '/'
    click_link 'sign in'
    expect(page).to have_content 'sign in'
  end

  scenario 'go to sign up' do
    visit '/'
    click_link 'sign up'
    expect(page).to have_content 'sign up'
    expect(page).to_not have_content 'your passwords did not match, try again'
  end

  scenario 'signed in' do
    sign_in
    expect(page).to have_content 'welcome Name'
  end

  scenario 'get password wrong' do
    visit '/'
    click_link 'sign in'
    fill_in 'email', with: 'email'
    fill_in 'password', with: 'notmypassword'
    click_button 'submit'
    expect(page).to have_content 'you could not be signed in, try again'
  end

  scenario 'can log out' do
    sign_in
    click_button 'log out'
    expect(page).to have_link 'sign up'
  end

  scenario 'make peep' do
    sign_in
    fill_in 'peep', with: 'test new peep out'
    click_button 'submit'
    expect(page).to have_content 'test new peep out'
  end

  scenario 'can sign up' do
    visit '/'
    click_link 'sign up'
    fill_in 'name', with: 'Testy McTestface'
    fill_in 'email', with: 'new@emailcom'
    fill_in 'handle', with: 'stuff'
    fill_in 'password', with: 'password'
    fill_in 'verify_password', with: 'password'
    click_button 'submit'
    expect(page).to have_content 'welcome Testy'
  end

  scenario 'can\'t sign up with mismatched password' do
    visit '/'
    click_link 'sign up'
    fill_in 'name', with: 'Testy McTestface'
    fill_in 'handle', with: 'stuff'
    fill_in 'email', with: 'new@emailcom'
    fill_in 'password', with: 'password'
    fill_in 'verify_password', with: 'passwird'
    click_button 'submit'
    expect(page).to have_content 'your passwords did not match, try again'
  end

  scenario 'add a reply' do
    sign_in
    click_link('peep back', :match => :first)
    fill_in 'reply', with: 'a reply of some sort'
    click_button 'submit'
    expect(page).to have_content 'a reply of some sort'
  end
end
