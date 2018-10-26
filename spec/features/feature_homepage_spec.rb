feature 'feature.Homepage' do
  scenario 'Header' do
    visit('/')
    expect(page).to have_content "Chitter"
  end
end
