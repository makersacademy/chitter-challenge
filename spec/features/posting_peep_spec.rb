feature 'Posting a peep' do
  scenario 'posting a peep that gets displayed' do
    visit('/post_peep')
    fill_in('peep_field', with: 'peep test')
    click_button('Submit')
    expect(page).to have_content('peep test')
  end

  scenario 'post more than one peep that gets displayed' do
    visit('/post_peep')
    fill_in('peep_field', with: 'peep test')
    click_button('Submit')
    click_button('PEEP')
    fill_in('peep_field', with: 'more peep test')
    click_button('Submit')
    expect(page).to have_content('peep test')
    expect(page).to have_content('more peep test')
  end
end
