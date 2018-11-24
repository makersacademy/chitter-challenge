feature 'view the timeline' do
  scenario 'welcomes the user' do
    visit '/'
    expect(page).to have_content 'hello'
  end
end
