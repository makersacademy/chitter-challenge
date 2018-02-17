feature 'infrastructure setup' do
  scenario 'displays chitter homescreen' do
    visit '/'
    expect(page).to have_content "Chitter"
  end
end
