feature 'First page' do
  scenario 'shows text' do
    visit '/'
    expect(page).to have_content 'Post your peep ;)'
  end
end
