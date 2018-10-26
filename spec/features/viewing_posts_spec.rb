feature 'Viewing posts' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Chitter!"
  end

  scenario 'seeing posts on page' do
    visit('/')
    expect(page).to have_content 'This is a Chitter post'
  end
end
