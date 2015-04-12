require 'spec_helper'
require_relative 'helpers/session'
require_relative 'helpers/peep_helper'
require_relative 'helpers/follow_helper'
require_relative 'helpers/message_helper'

include SessionHelpers
include PeepHelpers
include FollowHelpers
include MessageHelpers

feature 'A user that wants to send a private message' do
  before do
    sign_up
    peep_log_out
    john_signs_up
    log_in_follow_peep_log_out
  end

  scenario 'can do it only if he is both following and follower' do
    log_in("bob89", "password")
    follow
    send_mail
    expect(page).to have_content "Message Sent!!"
  end

  scenario 'cannot do it if is not follower' do
    log_in("bob89", "password")
    click_mail
    click_link "Send Message"
    select_path = "//select[@name = 'reciver']/option[text() = 'john89']"
    expect(page).not_to have_xpath select_path
  end

  scenario 'cannot do it if is not being followed' do
    log_in("john89", "password")
    click_mail
    click_link "Send Message"
    select_path = "//select[@name = 'reciver']/option[text() = 'bob89']"
    expect(page).not_to have_xpath select_path
  end
end

feature 'A user that recives a private message' do
  before do
    two_users_signs_and_one_send_mail
  end

  scenario 'can view it in inbox' do
    log_in("john89", "password")
    click_mail
    find('.peep-box').click
    expect(page).to have_content('Text')
  end
end
