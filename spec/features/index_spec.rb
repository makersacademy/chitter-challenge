RSpec.feature 'testing' do
  scenario 'user visits the homepage' do
    visit '/'
    expect(page).to have_content 'Hello World'
  end
end
