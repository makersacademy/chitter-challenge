feature 'Viewing peeps' do

  scenario 'I can see peeps on the home page' do
    Peep.create(name: 'My Name', username: 'My Username', text: 'Testing')
    visit '/peeps'
    expect(page.status_code).to eq 200
    within 'ul#peeps' do
      expect(page).to have_content('Testing')
    end
  end

  scenario 'I can create a peep' do
    visit '/peeps'
    click_button('New Peep')
    fill_in :name, with: 'My Name'
    fill_in :username, with: 'My Username'
    fill_in :text, with: 'Testing Again'
    click_button('Post Peep')
    expect(current_path).to eq '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content('Testing Again')
    end
  end
end
