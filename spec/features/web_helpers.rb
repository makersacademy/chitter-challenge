def post_peep(peep)
  visit '/chitter/new_peep'
  fill_in 'message', with: peep
  click_on 'Submit'
end
