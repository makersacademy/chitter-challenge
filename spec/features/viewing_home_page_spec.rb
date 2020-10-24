feature 'Viewing home page' do
  scenario ' visiting the home page' do
    visit('/')
    expect(page).to have_content "Hello Chitter"
  end
end
