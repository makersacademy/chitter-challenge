feature 'homepage' do
  scenario 'shows the title Chitter' do
    visit '/chitter'
    expect(page).to have_content 'Chitter'
  end
end
