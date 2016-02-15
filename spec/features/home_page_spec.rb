
feature 'home page' do
  scenario 'has the title of the web app' do
    visit '/'
    expect(page).to have_content "Chitter"
  end
end
