def new_peep(text)
  click_link('New peep')
  fill_in('peep', with: "#{text}")
  click_button('Submit')
end
