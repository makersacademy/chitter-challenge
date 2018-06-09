feature 'Testing infrastructure' do
  scenario 'homepage shows correct content' do
    visit '/'
    expect(page).to have_content "Welcome to Chitter!"
  end
end 
