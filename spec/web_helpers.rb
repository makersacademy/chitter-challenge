def long_peep
  " This is over 130 characters and should fail to save.
    This is over 130 characters and should fail to save.
    This is over 130 characters and should fail to save.
    This is over 130 characters and should fail to save.
    This is over 130 characters and should fail to save. "
end

def post_a_peep
  visit '/peeps'
  fill_in 'peep_entry', with: "This is a test peep!"
  click_on('Post')
end
