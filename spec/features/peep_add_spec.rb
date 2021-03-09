feature 'add peep message' do
  scenario 'a user can add a new peep to list of peeps' do
    User.create(email:'fake_email@testing.com', fullname:'John Jones', username:'JJones', password:'password123')
    visit('/peeps')
    click_button('Sign in')
    expect(current_path).to eq '/sessions/new'
    fill_in('email', with:'fake_email@testing.com')
    fill_in('password', with:'password123')
    click_button('Sign in')

    expect(current_path).to eq '/peeps'
    click_button('Peep!')
    fill_in('content', with:'This is a test peep')
    click_button('Submit')
    expect(current_path).to eq '/peeps'

    expect(page).to have_content "This is a test peep"
  end

  scenario 'new peep contains fullname, username and timestamp' do

    visit('/users/new')
    fill_in('email', with:'fake_email@testing.com')
    fill_in('fullname', with:'John Jones')
    fill_in('username', with:'JJones')
    fill_in('password', with:'password123')
    click_button('Submit')

    click_button('Peep!')
    expect(current_path).to eq '/peeps/new'
    fill_in('content', with:'This is a test peep')
    click_button('Submit')
    expect(current_path).to eq '/peeps'

    expect(page).to have_content('John Jones')
    expect(page).to have_content('JJones')
    expect(page).to have_content('2021')
  end

end
