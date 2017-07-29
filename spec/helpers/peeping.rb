module PeepingHelpers
  def peep_1
    visit('/peeps/new')
    fill_in :peep, with: "My first peep!"
    click_button "Peep!"
  end

  def peep_2
    sleep 1
    visit('/peeps/new')
    fill_in :peep, with: "My second peep!"
    click_button "Peep!"
  end
end
