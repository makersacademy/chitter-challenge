feature 'Viewing peeps' do
  scenario 'A user can see the index page' do
    visit('/peeps')
    expect(page).to have_content "Chitter"
  end
end
