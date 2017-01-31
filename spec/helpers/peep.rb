module PeepHelpers
  def add_new_post
    visit '/peeps'
    fill_in(:text, with: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
    click_button('Add Peep')
  end

  # def add_link_multiple_tags
  #   visit '/links/new'
  #   fill_in(:title, with: 'Facebook')
  #   fill_in(:url, with: 'www.facebook.com')
  #   fill_in(:tag, with: 'social bubbles')
  #   click_button('Save')
  # end
end
