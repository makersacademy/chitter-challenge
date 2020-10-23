feature 'testing infrastructure' do
  scenario 'Homepage displayed correctly' do
    visit('/chitter')
    expect(page).to have_content "Chitter"
  end
end
