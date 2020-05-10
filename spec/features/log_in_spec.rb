feature 'Log in' do
  scenario 'a user can log in' do
    User.create(name: 'Marius', username: 'mbrad26', email: 'marius2020@gmail.com', password: 'apassword')

    visit '/peeps'

    click_button 'Log In'

    expect(current_path).to eq '/sessions/new'
    expect(page).to have_content 'Log In'

    fill_in :email, with: 'marius2020@example.com'
    fill_in :password, with: 'apassword'
    click_button 'Sign In'

    # expect(current_path).to eq '/peeps'
    # page.find_by_id('welcome')
  end

  scenario 'a user can see an error if they got their email wrong' do
    User.create(name: 'Marius', username: 'mbrad26', email: 'marius2020@gmail.com', password: 'apassword')

    visit '/sessions/new'
    fill_in :email, with: 'agadg@gmail.com'
    fill_in :password, with: 'apassword'
    click_button 'Sign In'

    # expect(current_path).to eq '/sessions/new'
    expect(page).to have_content "Email and/or password do not match"
  end

  scenario 'a user can see an error if they got their password wrong' do
    User.create(name: 'Marius', username: 'mbrad26', email: 'marius2020@gmail.com', password: 'apassword')

    visit '/sessions/new'
    fill_in :email, with: 'marius2020@gmail.com'
    fill_in :password, with: 'wrongpassword'
    click_button 'Sign In'

    # expect(current_path).to eq '/sessions/new'
    expect(page).to have_content "Email and/or password do not match"
  end


end
