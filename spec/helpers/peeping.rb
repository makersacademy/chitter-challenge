module PeepingHelpers
  def peep_1
    visit('/peeps/new')
    fill_in :peep, with: "Good grief!"
    click_button "Peep!"
  end

  def peep_2
    sleep 1
    visit('/peeps/new')
    fill_in :peep, with: "Oh, carrots!"
    click_button "Peep!"
  end
end
