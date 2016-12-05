module PeepHelpers

  def peep
    fill_in('new_peep', with: "ROFLCOPTER")
    click_button('Peep')
  end
  
end
