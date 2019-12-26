require_relative '../web_helper.rb'

feature 'time' do

  scenario 'peeps show the time at which they were posted' do
    create_account
    sign_in
    click_on 'Post Message'
    fill_in 'message', with: 'Hello world'
    click_on 'Post'
    p 'hello'
    expect(page).to have_content "#{Time.now.strftime("%k:%M:%S on %d/%m/%Y")}"
  end

end
