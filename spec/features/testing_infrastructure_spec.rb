feature 'testing homepage functionality' do
  scenario 'ensuring the homepage has content' do
    visit ('/')
    expect(page).to have_content 'test'
  end
end
