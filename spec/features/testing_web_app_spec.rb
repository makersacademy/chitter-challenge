feature 'Testing' do
  scenario 'Hello!' do
    visit('/')
    expect(page).to have_content 'Hello!'
  end
end
