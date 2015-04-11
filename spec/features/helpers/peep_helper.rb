module PeepHelpers

  def peep(text)
    fill_in :peep, with: text
    click_button 'Peep'
  end

  def comment(text)
    fill_in :text, with: text
    click_button 'Insert comment'
  end

end