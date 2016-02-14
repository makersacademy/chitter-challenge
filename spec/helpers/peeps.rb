module PeepHelpers

  def post_a_peep
    signup
    login
    click_link('Peep')
    fill_in('content', with:'Hello world, this is my first peep!')
    click_button('Post peep')
  end
end
