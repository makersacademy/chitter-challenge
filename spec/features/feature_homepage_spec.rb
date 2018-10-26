feature 'feature.Homepage' do
  scenario 'Hello world' do
    visit('/')
    expect(page).to have_content "Hello world"
  end
end
