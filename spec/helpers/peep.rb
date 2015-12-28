module PeepHelpers
  def create_new_peep(content: 'Peep exemple!')
    visit('peeps/new')
    fill_in(:content, with: content)
    click_button('Peep')
  end
end
