feature 'testing infrastructure' do
  scenario 'Homepage displayed correctly' do
    visit('/')
    expect(page).to have_content "Chitter"
  end
end
