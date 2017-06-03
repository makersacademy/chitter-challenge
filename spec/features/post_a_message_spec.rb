
feature 'Post message' do
  scenario 'User is able to post a message to chitter' do
    visit('/message')
    fill_in 'contex', with: 'peep'
    expect(page.status_code).to eq 200
    expect(page).to have_content 'peep'
  end
end
