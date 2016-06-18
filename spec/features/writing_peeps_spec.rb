feature 'Writing peeps' do
  scenario 'I can post a new peep' do
    visit '/peeps/new'
    fill_in 'peep_content', with: 'Makers Academy is great!'
    click_button 'Post Peep'
    expect(current_path).to eq '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content('Makers Academy is great!')
    end
  end
end
