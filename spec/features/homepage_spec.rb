feature 'You can see the homepage with chitter on it' do
  scenario do
    visit '/'
    expect(page).to have_content "chitter"
  end
end
