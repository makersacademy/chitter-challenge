feature 'Test infrastructure' do

  scenario 'hello world' do
    visit('/')
    expect(page).to have_content 'Hello world!'
  end

end