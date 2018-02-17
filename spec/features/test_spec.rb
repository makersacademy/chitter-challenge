feature 'test' do
  scenario 'display working' do
    visit '/'
    expect(page).to have_content "Welcome to Chitter!"
  end
end
