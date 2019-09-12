feature 'Viewing chitter page' do
  scenario 'Visting main page' do
    visit('/')
    expect(page).to have_content "It's a fake twitter bitch"
  end
end
