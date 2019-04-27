feature 'Viewing peeps' do
  scenario 'checks current peeps' do
    visit('/chitters')
    expect(page).to have_content "Chitter!"
  end
end
