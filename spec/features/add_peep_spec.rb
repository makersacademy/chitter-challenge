

feature 'post a peep' do
  scenario 'user can post a peep' do
    visit '/'
    expect(page).to have_content "Hello World"
  end
end
