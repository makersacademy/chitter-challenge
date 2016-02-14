feature 'Peeps' do
  scenario 'A user can post a peep and view it on the homepage' do
    signup
    fill_in('peep', with: "Hello chitter")
    click_button('Peep')
    expect(page).to have_content "Hello chitter"
  end

  scenario 'A user posts a peep and he can see that it\'s from him' do
    signup
    fill_in('peep', with: "Hello chitter")
    click_button('Peep')
    expect(page).to have_content "Alex peeped:"
  end

  scenario 'A user can post a reply to a peep' do
    signup
    fill_in('peep', with: "Hello chitter")
    click_button('Peep')
    click_link('Reply')
    expect(current_path).to eq '/peeps/reply'
    fill_in('peeparea', with: 'hello peeper')
    click_button('Reply')
    reply = Reply.first(reply: 'hello peeper')
    expect(reply.reply).to eq 'hello peeper'
  end

  scenario 'A user can view posted replies on peeps' do
    signup
    fill_in('peep', with: "Hello chitter")
    click_button('Peep')
    click_link('Reply')
    expect(current_path).to eq '/peeps/reply'
    fill_in('peeparea', with: 'hello peeper')
    click_button('Reply')
    click_link('View Replies')
    expect(page).to have_content('hello peeper')
  end
end
