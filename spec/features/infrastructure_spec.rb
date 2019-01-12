RSpec.feature 'testing framework/local host' do
  scenario 'initial setup' do
    visit '/'
    expect(page).to have_text('Home')
  end
end
