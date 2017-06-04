feature 'Peep Visibility' do
  scenario 'user can post and then see a peep' do
    sign_up_test
    visit('/add_peep')
    expect(page.status_code).to eq 200
    fill_in "content", with: "an experimental test peep"
    click_button('Submit')
    expect(page).to have_content("an experimental test peep")
  end

  scenario 'user sees peeps in reverse chronological order' do
    sign_up_test
    visit('/add_peep')
    fill_in "content", with: "older peep"
    click_button('Submit')
    visit('/add_peep')
    fill_in "content", with: "newer peep"
    click_button('Submit')
    expect(page).to have_content("newer peep", "older peep")
  end

  scenario 'user can see timestamp' do
    sign_up_test
    visit('/add_peep')
    fill_in "content", with: "timestamped peep"
    click_button('Submit')
    expect(page).to have_content('2017')
  end
end
