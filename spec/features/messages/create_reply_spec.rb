require './lib/message'
 
feature 'adding replies' do
  scenario 'to a message' do
    Message.create(text: "Hello World!")
    log_in
    click_button 'Reply'
    fill_in :reply_text, with: 'This is cool!'
    click_button 'Cheet your reply'
    click_button 'Show replies'
    expect(page).to have_content 'This is cool!'
  end
end
