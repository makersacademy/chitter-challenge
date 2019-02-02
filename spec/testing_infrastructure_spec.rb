feature 'Test Infrastructure' do
  scenario 'testing environment should be setup' do
    visit ('/')
    expect(page).to have_content 'Hello World!'
  end
end
