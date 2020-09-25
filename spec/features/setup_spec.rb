feature 'index page' do
  scenario 'it shows the app name on the index page' do
    visit '/'
    expect(page).to have_content 'Shore'
  end
end