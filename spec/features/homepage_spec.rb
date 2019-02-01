feature 'You can see the homepage with chitter on it' do
  scenario do
    visit '/'
    expect(page).to have_content "chitter"
  end
end

feature 'You can click on a button and go to the newsfeed' do
    scenario do
      visit '/'
      click_button 'Enter'
      expect(page).to have_content "Newsfeed"
    end
end
