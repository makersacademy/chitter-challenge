feature 'Viewing chitters' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Chitter"
  end

  scenario 'A user can view chitters' do
    visit('/peeps')
    expect(page).to have_content "Peep test 1"
    expect(page).to have_content "Peep test 2"
    expect(page).to have_content "Peep test 3"
  end
end 