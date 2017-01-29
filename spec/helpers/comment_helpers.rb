def comment
  sign_up_other_user_and_peep
  sign_out
  sign_up
  peep
  fill_in :'peep-1-comment', with: 'Hi Tifa!'
  click_button 'comment-1'
end
