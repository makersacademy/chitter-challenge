
feature 'testing environment setup' do
  scenario 'Hello_World shown on setup' do
    visit '/'
    expect(page).to have_content 'Hello, world!'
  end
end
