module PeepHelpers

  def post_a_peep(content:)
    visit('/peeps')
    click_button('add_new_peep')
    fill_in 'content', :with => content
    click_button('post_peep')
  end

end
