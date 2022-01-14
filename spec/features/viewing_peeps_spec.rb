feature 'Viewing peeps' do
  scenario 'peeps can be viewed' do
    add_three_peeps

    visit '/peeps'

    expect(page).to have_content('peep: 1')
    expect(page).to have_content('peep: 2')
    expect(page).to have_content('peep: 3')
  end
end
