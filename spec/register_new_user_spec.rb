feature 'Registering new users' do
  scenario 'User\'s details are saved and username is displayed' do
    User.create(username: 'flimflamjim', email: 'billandben@hotmail.com', password: 'banana')

    visit '/users/new'
    expect(page.status_code).to eq 200
    expect(page).to have_content 'Welcome flimflamjim'
  end
end