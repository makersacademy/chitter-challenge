def register_user
  find_by_id('register_summoner').click
  fill_in 'summoner_username', with: 'Yunalesca'
  fill_in 'summoner_email', with: 'yunalesca@gmail.com'
  fill_in 'summoner_password', with: 'yunalescaisamazing'
  fill_in 'summoner_pw_confirm', with: 'yunalescaisamazing'
  click_on 'Submit'
end
