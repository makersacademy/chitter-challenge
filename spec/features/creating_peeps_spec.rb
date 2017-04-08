feature 'Creating peeps' do
  scenario 'I can create a new peep' do
    visit '/peeps/new'
    fill_in 'message', with: 'Creating a peep'
    click_button 'Post Peep!'

    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content 'Creating a peep'
    end
  end
end
