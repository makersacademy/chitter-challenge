feature 'feed' do

  before do
    visit('/')
    fill_in('username', with: 'testperson1')
    fill_in('password', with: 'password')
    click_on('login')
  end

  scenario 'feed' do
    expect(page).to have_selector(:link_or_button, 'log out')
    expect(page).to have_selector(:link_or_button, 'add peep')
    expect(page).to have_content('testperson1 the Chitter*rer')
    expect(page).to have_content('chitter 1')
  end

end
