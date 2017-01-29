module PostPeepHelpers

  def post_peep(peep_text)
    click_link('new_peep')
    fill_in :peep_text, with: peep_text
    click_button('submit_peep')
  end

end
