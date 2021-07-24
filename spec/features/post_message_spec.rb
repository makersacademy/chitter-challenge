feature 'post message' do
  scenario 'can post a message to chitter' do
    post_peep

    expect(current_path).to eq('/peeps')
    expect(page).to have_content('Here is a test peep')
  end
end
