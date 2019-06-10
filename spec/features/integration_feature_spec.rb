feature 'the application setup works' do
  scenario 'the application can be opened in a web browser' do
    visit '/'
    expect(page).to have_content("Chitter")
  end
end