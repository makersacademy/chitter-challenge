feature 'creating new peeps' do
  
  scenario 'user can post a new peep' do
    user = build(:user)
    sign_up(user)
    sign_in(user)
    visit('/peeps/new')
    fill_in 'body', with: 'sup peeps!'
    click_button 'peeps away!'
    expect(page).to have_content 'sup peeps!'
  end

  scenario 'non registered user cannot post peeps' do
    visit('/')
    click_button 'fresh peep'
    expect(page).to have_content 'sign in or register to get peeping!'
  end

end
