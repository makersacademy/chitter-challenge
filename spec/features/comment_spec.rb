feature 'adding comments' do
  include SessionHelpers

  let(:peep_content) { "Some content"}
  let(:username) { "dante_alighieri" }
  let(:comment_content) { "Some comment"}

  before do
    register(username: username)
    Capybara.reset!
  end

  scenario 'is not possible if user is not logged in' do
    login
    add_peep(content: peep_content)
    click_button('Log out')
    click_button 'Reply'
    expect(current_path).to eq '/register'
  end

  scenario 'when user is logged in' do
    login
    add_peep(content: peep_content)
    fill_in('comment_content', with: comment_content)
    click_button 'Reply'
    expect(current_path).to eq '/peeps'
    expect(page).to have_content comment_content
  end

end
