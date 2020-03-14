feature 'viewing a list of peeps' do
  scenario 'user can see a list of peeps' do
    visit('/')
    expect(page).to have_content('Chitter')
    expect(page).to have_content('Peeps:')
  end
end
