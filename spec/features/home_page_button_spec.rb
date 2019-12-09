feature 'Send user to add page' do
  scenario 'A user clicks a link that send them to the peep page' do
    sign_in_and_chatter
    expect(current_path).to eq '/peeps/new'
    expect(page).to have_content 'Post a message onto Chitter'
  end
end
