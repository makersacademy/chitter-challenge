feature 'Viewing peeps' do
  scenario 'visiting the index page' do
    visit '/peeps'

    expect(page).to have_content("CHITTER")
  end
end
