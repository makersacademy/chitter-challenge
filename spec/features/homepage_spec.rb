feature 'When accesing home page' do
  scenario 'can see greeting' do
    visit '/'
    expect(page).to have_content "Welcome to chitter"
  end
end
