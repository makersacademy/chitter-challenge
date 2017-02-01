module PeepHelpers
  def add_new_post
    visit '/peeps'
    fill_in(:text, with: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
    click_button('Add Peep')
  end
end
