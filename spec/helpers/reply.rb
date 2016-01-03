module ReplyHelpers
  def create_new_reply(content: 'Reply!')
    visit('peeps')
    click_link('Details')
    fill_in(:content, with: content)
    click_button('Reply')
  end
end
