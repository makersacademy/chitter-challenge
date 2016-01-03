# As a maker
# In order to start a conversation
# I want to reply to a peep from another maker

feature 'Creating a reply' do
  before do
    sign_in
    create_new_peep
  end
  scenario 'display a reply button' do
    expect(page).to have_content('Reply')
  end
  scenario 'reply count increases by 1' do
    expect { create_new_reply }.to change { Reply.count }.by(1)
  end
  scenario 'do not allow to reply if not signed in' do
    sign_out
    visit('peeps')
    expect(page).not_to have_content('Reply')
  end
end

feature 'Displaying replies' do
  before do
    sign_in
    create_new_peep
  end
  scenario 'replies are displayed in chronological order' do
    create_new_reply(content: 'first')
    sign_out
    Timecop.travel(1) do
      sign_in
      create_new_reply(content: 'second')
    end
    expect('first').to appear_before('second')
  end
end
