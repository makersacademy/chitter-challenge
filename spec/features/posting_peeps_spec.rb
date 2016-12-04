feature 'Posting a peep' do
  let!(:user) do
    User.create(username: 'Example',
                name: 'Ex Zample',
                email: 'user123@example.com',
                password: 'secret123',
                password_confirmation: 'secret123')
  end
  scenario 'I can post a peep if signed in' do
    log_in(username: user.username, password: user.password)
    visit '/peeps/new'
    fill_in :message, with: 'My first peep'
    click_button 'Post peep'
    expect(current_path).to eq '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content("My first peep")
    end
  end
  scenario 'I cannot post a peep if not signed in' do
    visit '/peeps/new'
    expect(page).to have_content("Please sign in:")
  end
end
