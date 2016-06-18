feature 'Creating new peeps' do
  scenario 'I can create a new peep' do
    visit('/peeps/new')
    fill_in('message', with: 'Test')
    click_button('Post Peep')
    expect(current_path).to eq('/peeps')
    within 'ul#peeps' do
      expect(page).to have_content('Test')
    end
  end
end
