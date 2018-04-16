feature "home page content" do
  scenario 'chitter logo' do
    visit '/'
    expect(page).to have_content 'CHITTER'
  end

  scenario 'sign in button' do
    visit '/'
    expect(page).to have_button 'Sign in'
  end

  scenario 'peeps username & message' do
    Peep.create(username: 'feature test', message: 'peeeeeeeeeps')
    visit '/'
    expect(page).to have_content 'FEATURE TEST'
    expect(page).to have_content 'peeeeeeeeeps'
  end


end
