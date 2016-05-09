feature 'Registering new users' do
  scenario 'User\'s details are saved and username is displayed' do

    visit '/users/new'

    fill_in 'name', with: 'Emmett'
    fill_in 'username', with: 'flimflamjim'
    fill_in 'email', with: 'billandben@hotmail.com'
    fill_in 'password', with: 'banana'
    click_button 'Submit'

    expect(page).to have_content 'Welcome flimflamjim'
  end
end