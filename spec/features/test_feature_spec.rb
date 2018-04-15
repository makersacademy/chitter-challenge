feature 'visiting homepage' do
  scenario 'you can visit the homepage' do
    visit '/'
    expect(page).to have_content "Hello World"
  end
end
