feature 'Front page test' do
  scenario 'expect front page to have hello world on it' do
    visit ('/')
    expect(page).to have_content 'Hello World'
  end
end