feature 'Testing infrastrucutre' do
  scenario 'Run app and check page content' do
    visit('/')
    expect(page).to have_content 'Built by CodeRed30'
  end
end
