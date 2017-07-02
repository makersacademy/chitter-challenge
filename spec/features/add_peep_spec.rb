feature 'peeping' do
  scenario 'I would like to add a peep to chitter' do
    visit '/peeps/new'
    fill_in "peep", with: "profound observations"
    click_button "peep"

    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('profound observations')
    end
  end
end
