feature 'check the home page is working' do
  scenario 'go to the home page and check it works' do
    visit '/'
    expect(page).to have_content "Chitter Challenge!"
  end
end
