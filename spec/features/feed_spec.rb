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
    expect(page).to have_selector(:link_or_button, 'edit')
    expect(page).to have_selector(:link_or_button, 'delete')
    expect(page).to have_content('testperson1 the Chitter*rer')
    expect(page).to have_content('chitter 1')
  end

  scenario 'add peep' do
    fill_in('peep', with: "body of peep")
    click_on('add peep')
    expect(page).to have_content("body of peep")
  end

  scenario 'delete peep' do
    click_on('delete1')
    expect(page).not_to have_content("body of peep")
  end

  scenario 'edit peep' do
    click_on('edit1')
    fill_in('peep', with: 'change the content')
    click_on('done')
    expect(page).to have_content("change the content")
  end

  scenario 'go to edit peep but then go back' do
    click_on('edit1')
    click_on('cancel')
    expect(page).to have_content("chitter 1")
  end

end
