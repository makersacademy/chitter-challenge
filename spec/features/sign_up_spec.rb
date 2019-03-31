feature 'Sign up to chitter' do
  scenario 'user fills a form with thier details' do
    visit '/sign_up'
    fill_in('fullname', with: 'Riya Dattani')
    fill_in('email', with: 'riya@gmail.com')
    fill_in('username', with: 'riya')
    fill_in('password', with: 'maker123')

    click_button 'Submit'
    expect(page).to have_current_path('/chitter/new')
  end
end
