module PeepingHelpers
  def peep_1
    visit('/peeps/new')
    fill_in :peep, with: "Good grief!"
    fill_in :tags, with: "penfold"
    click_button "Peep!"
  end

  def peep_2
    sleep 1
    visit('/peeps/new')
    fill_in :peep, with: "Oh, carrots!"
    fill_in :tags, with: "dangermouse"
    click_button "Peep!"
  end
end
