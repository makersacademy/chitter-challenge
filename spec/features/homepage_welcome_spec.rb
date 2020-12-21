feature 'homepage' do
  scenario 'welcomes user to the homepage' do
    visit '/'
    expect(page).to have_content 'Hello World'
  end
end
