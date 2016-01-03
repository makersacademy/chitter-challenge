feature 'adding comments' do
  include SessionHelpers

  let(:peep_content) { "Nel mezzo del cammin di nostra vita
                    mi ritrovai..."}
  let(:username) { "dante_alighieri" }
  let(:comment_content) { "I've written such a bad peep"}

  before do
    register(username: username)
    Capybara.reset!
  end

  scenario 'is not possible if user is not logged in' do
    login
    add_peep(content: peep_content)
    click_button('Log out')
    click_button 'Comment'
    expect(current_path).to eq '/register'
  end

  scenario 'when user is logged in' do
    login
    add_peep(content: peep_content)
    fill_in('comment_content', with: comment_content)
    click_button 'Comment'
    expect(current_path).to eq '/peeps'
    expect(page).to have_content comment_content
  end

end
