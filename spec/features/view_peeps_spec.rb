feature 'Viewing peeps' do
  scenario 'visits index page' do
    visit('/')
    expect(page).to have_content 'First peep!'
  end
end
