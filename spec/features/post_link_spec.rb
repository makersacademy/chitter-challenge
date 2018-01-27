feature 'posting peeps' do
  scenario 'I can post a peep to chitter' do
    visit '/peeps/new'
    fill_in 'peep_text', with: "This is my second peep and it's a good one!"

    click_button 'Post Peep'
    expect(current_path).to eq '/peeps'

    within('.peep') do
      peep = "This is my second peep and it's a good one!"
      expect(page).to have_content('peep')
    end
  end
end
