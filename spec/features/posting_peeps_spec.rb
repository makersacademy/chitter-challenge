feature 'posting a peep' do
  scenario 'logged in user can post a peep' do
    sign_up
    visit '/peeps/new'
    fill_in 'peep', with: 'First peep'
    click_button 'Post peep'
    expect(current_path).to eq '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content 'First peep'
    end
  end
end
