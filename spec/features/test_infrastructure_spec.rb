feature 'test' do
  scenario 'the project setup is working' do
    visit '/'
    expect(page).to have_content 'hello world'
  end
end
