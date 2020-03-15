feature 'Welcome page' do
  scenario 'Welcoming message' do
    visit '/'
    expect(page).to have_content("This is Chitter, your instant message service!")
  end
end
