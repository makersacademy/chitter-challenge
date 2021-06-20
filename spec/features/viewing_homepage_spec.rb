feature 'Testing homepage' do
  scenario 'viewing homepage' do
    visit '/'
    expect(page).to have_content 'Hello World'
  end
end