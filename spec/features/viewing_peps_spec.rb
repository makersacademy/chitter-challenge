feature 'View login page' do
  scenario 'Visit the index page' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter App, click Register if you are a new user, or click Login if you are already an existing user!"
  end
end

feature 'Introducing credentials' do
  scenario 'User can enter their registering credentials' do
    visit('/register')
    fill_in('e-mail', with: 'evelyn@ipsoft.es')
    fill_in('password', with: 'carpediem')
    fill_in('name', with: 'Evelyn')
    fill_in('username', with: 'EvelynAleLeo')
    click_button('Submit')
    
    expect(page).to have_content 'Evelyn'
  end
  scenario 'User can enter their login credentials' do
    visit('/login')
    fill_in('e-mail', with: 'evelyn@ipsoft.es')
    fill_in('password', with: 'carpediem')
    click_button('Submit')

    expect(page).to have_content 'Welcome'
  end
end