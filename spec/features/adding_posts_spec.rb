feature 'Adding posts' do
  scenario 'can post a new message' do
    visit('/')
    click_button 'Write Peep'

    expect(current_path).to eq '/write-peep'
    expect(page).to have_content 'New peep:'

    fill_in 'content', with: "Writing a new peep"
    click_button 'Post'

    expect(current_path).to eq '/'
    expect(page).to have_content "Writing a new peep"
  end
end
