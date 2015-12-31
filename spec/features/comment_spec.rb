feature 'adding comments' do

  let(:peep_content) { "Nel mezzo del cammin di nostra vita
                    mi ritrovai..."}
  let(:username) { "dante_alighieri" }
  let(:comment_content) { "I've written such a bad peep"}

  before do
    register(username: username)
    Capybara.reset!
  end

  scenario 'on own peep' do
    login
    add_peep(content: peep_content)
    click_button 'Comment'
    fill_in('content', with: comment_content)
    click_button 'Comment'
    expect(current_path).to eq '/peeps'
    expect(page).to have_content comment_content
  end

  scenario 'cancelling action' do
    login
    add_peep(content: peep_content)
    click_button 'Comment'
    fill_in('content', with: comment_content)
    click_link 'Cancel'
    expect(current_path).to eq '/peeps'
    expect(page).not_to have_content comment_content
  end
end
