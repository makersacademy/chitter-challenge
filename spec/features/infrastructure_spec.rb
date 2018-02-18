feature 'infrastructure setup' do
  scenario 'displays the homepage' do
    visit '/'
    expect(page).to have_content "Chitter Challenge"
  end
end
