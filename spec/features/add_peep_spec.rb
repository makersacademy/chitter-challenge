feature 'Add to the list of peeps' do

  scenario 'Have ability to add new peep' do
    visit '/peeps/new'
    expect(page).to have_content 'add your knit tip'
  end

  scenario 'User can add text to a peep' do
    visit '/peeps/new'
    fill_in 'text', with: "The crotchet hook is a knitter's best friend"
    click_button 'Add Tip'
    expect(current_path).to eq '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content "The crotchet hook is a knitter's best friend"
    end
  end
end
