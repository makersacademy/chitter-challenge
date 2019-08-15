feature 'Viewing message' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Hello Chitter"
  end
end