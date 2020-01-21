feature 'viewing peeps' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page). to have_content "Welcome to Chitter"
  end
end
