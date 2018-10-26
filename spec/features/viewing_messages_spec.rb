feature 'Feature - Viewing messages' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Chitter"
  end

  scenario 'a user can see messages' do
    visit('./messages')

    expect(page).to have_content "This is my first peep"
    expect(page).to have_content "This is my second peep"
  end
end
