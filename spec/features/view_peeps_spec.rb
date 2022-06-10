feature 'homepage' do
  xscenario 'shows the title Chitter' do
    visit '/chitter'
    expect(page).to have_content 'Chitter'
  end
end