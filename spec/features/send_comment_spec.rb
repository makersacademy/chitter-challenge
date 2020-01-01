require_relative '../web_helper.rb'

feature 'send comments' do

  scenario 'should be able to comment on posts if signed in' do
    create_account
    sign_in
    post_message('Hello world')
    click_on 'Comment'
    fill_in 'comment', with: 'Hi!'
    click_on 'Send'
    click_on 'See Comments'
    expect(page).to have_content 'Hi!'
  end

end
