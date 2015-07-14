module PostPeepHelpers

  def post(message)
    visit '/peeps/new'
    fill_in :peep, with: 'Hello, world'
    click_button 'Post peep'
  end

end