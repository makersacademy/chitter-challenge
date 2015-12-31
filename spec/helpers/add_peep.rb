def add_peep(content: 'Some stuff in')
  click_button "Add peep"
  fill_in("content", with: content)
  click_button("Peep!")
end
