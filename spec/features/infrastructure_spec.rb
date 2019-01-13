RSpec.feature 'infrastructure' do
  scenario 'can visit homepage' do
    visit '/'
    expect(page).to have_content 'Chitter'
  end
end
