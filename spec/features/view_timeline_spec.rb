feature 'Viewing Chitter' do
  scenario 'User can visit Chitter homepage' do
    visit ('/')
    expect(page).to have_content "Welcome to Chitter!"
  end
end

