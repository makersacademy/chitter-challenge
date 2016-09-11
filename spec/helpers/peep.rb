module PeepHelpers

  def make_peep(message: 'A message')
    visit '/'
    click_button 'Peep'
    fill_in :message, with: message
    click_button 'Peep this'
  end
end
