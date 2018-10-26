feature 'Viewing chipper' do
  scenario 'visiting the index page' do
    visit '/'
    expect(page).to have_content "Chipper"
  end
end
