feature 'Posting a peep' do
  scenario 'posting a peep that gets displayed' do
    visit('/post_peep')
      fill_in('peep_field', with: 'peep test')
      click_button('Submit')
    expect(page).to have_content('peep test')
  end
end
