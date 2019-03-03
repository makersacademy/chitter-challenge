feature 'create new peep' do
  scenario 'create a new peep when maker is logged in' do
    build_maker
    visit '/'
    expect(page).to have_content 'Welcome to Chitter!' and 'OR'
    expect(page).to have_button('View all Peeps')
    expect(page).to have_button('Signup')
    expect(page).to have_button('Login')
    expect(page).to have_content "to post a peep!"
    click_button 'Login'
    expect(current_path).to eq '/chitter/login'
    fill_in :email, with: 'joebloggs@gmail.com'
    fill_in :password, with: 'password'
    click_button 'Submit'
    expect(page).to have_button('view all peeps')
    expect(page).to have_button('create a peep')
    expect(page).to have_content 'Welcome to Chitter Joe Bloggs' and 'What would you like to do?'
    expect(current_path).to eq '/chitter/maker/homepage'
    click_button 'create a peep'
    expect(current_path).to eq '/chitter/peep/new'
    fill_in 'message', with: 'This is a new peep'
    click_button 'Submit'
    expect(page).to have_content 'This is a new peep'
    expect(current_path).to eq '/chitter/peep/all'
  end
end

feature 'create new peep' do
  scenario 'redirect to error page asking to signup or login when maker is not logged in' do
    visit '/chitter/peep/new'
    expect(page).to have_content 'You must login or signup to create a peep'
    expect(page).to have_button('Return to Mainpage')
    expect(current_path).to eq '/chitter/peep/new'
  end
end
