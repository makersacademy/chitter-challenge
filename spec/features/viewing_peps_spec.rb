feature 'View login page' do
  scenario 'Visit the index page' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter App, click Login to start peeping"
  end
end

feature 'Introducing login credentials' do
  scenario 'User can enter their credentials' do
    visit('/login')
    fill_in('e-mail', with: 'evelyn@ipsoft.es')
    fill_in('password', with: 'carpediem')
    fill_in('name', with: 'Evelyn')
    fill_in('username', with: 'EvelynAleLeo')
    click_button('Submit')
    
    expect(page).to have_content 'Evelyn'
  end
end
