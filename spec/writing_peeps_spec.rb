feature 'Writing Peeps' do
  scenario 'User can write a peep' do
    visit '/peeps/new'
    fill_in 'message', with: "Test Peep"
    click_button 'Send Peep'
    expect(current_path).to eq('/peeps')
    within 'ul#peeps' do
      expect(page).to have_content('Test Peep')
    end
  end
end
