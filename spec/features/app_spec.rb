feature Chitter do 

  scenario 'redirects to peeps page visiting home page' do
    visit '/'
    expect(page).to have_content('Peeps') 
  end 

  scenario 'it displays the peeps' do 
    visit '/peeps'
    expect(page).to have_content('Today is a great day! Ask me why...')
  end 

  scenario 'it displays the name' do 
    visit '/peeps'
    expect(page).to have_content('Lauren')
  end 

  scenario 'displays option to add a new peep' do 
    visit '/peeps'
    expect(page).to have_field('text')
  end 

  scenario 'it displays new peep back as the first peep' do
    visit '/peeps'
    fill_in 'text', with: "cant wait to watch love island tonight"
    click_button 'Post Peep'
    expect(page).to have_content("cant wait to watch love island tonight")
  end

  scenario 'it displays buttons to login or sign up' do 
    visit '/peeps' 
    expect(page).to have_button('Log in')
    expect(page).to have_button('Sign up')
  end 

  scenario 'sign up button presents form for new user' do 
    visit '/peeps' 
    click_button 'Sign up'
    expect(page).to have_field('name')
    expect(page).to have_field('username')
    expect(page).to have_field('password')
    expect(page).to have_field('email')
  end 

  scenario 'creates a new user at sign up and lets them go to peeps' do 
    visit '/users/add'
    fill_in 'name', with: "Lauren"
    fill_in 'username', with: "lillozza"
    fill_in 'email', with: 'lauren+testing@blah.com'
    fill_in 'password', with: 'Password123'
    click_button 'Sign up'
    expect(page).to have_content('Welcome, Lauren')
    expect(page).to have_button('To the peeps!')
  end 

  scenario 'display error message if email not unique' do
    visit '/users/add'
    fill_in 'name', with: 'Lauren'
    fill_in 'username', with: "lil_lozza"
    fill_in 'email', with: 'lauren@blah.com'
    fill_in 'password', with: 'Password123'
    click_button 'Sign up'
    expect(page).to have_content('Your username or email has already been taken')
  end

  scenario 'login button presents form for user to login' do 
    visit '/peeps' 
    click_button 'Log in'
    expect(page).to have_field('username')
    expect(page).to have_field('password')
  end

  scenario 'display error message if username or password not correct' do
    visit '/users/login'
    fill_in 'username', with: "lil_lozza"
    fill_in 'password', with: 'Password123'
    click_button 'Log in'
    expect(page).to have_content('Your username or password is incorrect')
  end
end
