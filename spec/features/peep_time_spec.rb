require_relative 'test_helper'

feature 'peep has a time of creation' do
  scenario 'peep is shown with time' do
    create_account
    visit '/home'
    click_button 'New Peep'
    fill_in 'post', with: "Hello, chitter!"
    click_button 'Post'
    time = Time.new.strftime("%d/%m %H:%M")
    expect(page).to have_content "#{time}"
  end
end
