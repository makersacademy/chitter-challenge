feature 'visiting the homepage' do
  scenario 'the homepage is visible' do
    visit '/'
    expect(page).to have_content 'Home'
  end
end
