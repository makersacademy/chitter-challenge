feature 'Viewing cheeps' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Cheeps"
  end
end