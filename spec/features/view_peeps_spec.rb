feature 'view peeps' do
  scenario 'visiting the homepage' do
    visit('/')
    expect(page).to have_content('CHITTER')
  end

  scenario 'peep is created then can be viewed' do
    visit('/peeps/new')
    fill_in('peep', with: "Test peep")
    click_button('Submit')
    expect(page).to have_content("Test peep")
  end

end