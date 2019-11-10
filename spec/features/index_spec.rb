feature 'index page' do
  scenario 'signup' do
    visit '/'
    fill_in 'username', with: 'seven'
    fill_in 'password', with: 'secrets'
    click_button 'submit'
    expect(page).to have_content 'Welcome seven'
  end
end
