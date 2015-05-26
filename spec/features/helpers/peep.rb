module PeepHelpers
  def write_peep(text = "hello world")
    fill_in :peep, with: text
    click_button 'Add peep'
  end
end