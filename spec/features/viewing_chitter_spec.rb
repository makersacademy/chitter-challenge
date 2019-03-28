feature 'Viewing peeps' do
  scenario 'visiting the index page' do
    visit('/chitter')
    expect(page).to have_content "Welcome to Chitter"
  end
end
