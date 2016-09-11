module PeepHelpers

  def make_peep
    visit '/'
    click_button 'Peep'
    fill_in :message, with: 'A message'
    click_button 'Peep this'
  end
end
