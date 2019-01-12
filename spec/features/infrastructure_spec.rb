feature 'Testing infrastructure' do
  scenario 'can run app and check page content' do
    visit '/'
    expect(title).to have_content 'Chitter'
  end
end
