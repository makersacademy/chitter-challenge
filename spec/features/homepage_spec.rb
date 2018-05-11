feature 'homepage' do
  scenario 'displays home page' do
    visit '/chitter'
    expect(page).to have_content('Chitter')
  end
end
