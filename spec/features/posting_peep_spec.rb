feature 'posting a peep' do
  xscenario 'seeing peep after posting' do
    visit '/peeps'
    click_button 'Peep'
    fill_in('peep', with: 'Building chitter')
    click_button 'Post'

    expect(page).to have_content('Building chitter')
    expect(current_path).to be('/peeps')
  end
end
