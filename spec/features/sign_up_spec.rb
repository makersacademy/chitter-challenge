feature 'Sign up to chitter' do
  scenario 'user fills a form with their details' do
    visit '/sign_up'
    fill_in('fullname', with: 'Riya Dattani')
    fill_in('email', with: 'test@example.com')
    fill_in('username', with: 'riya')
    fill_in('password', with: 'password123')

    click_button 'Submit'
    expect(page).to have_current_path('/chitter/new')
    expect(page).to have_content 'Welcome Riya Dattani'
    expect(page).to have_content 'Peep something...'
  end
end
