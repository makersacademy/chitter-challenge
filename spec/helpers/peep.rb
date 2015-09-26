module PeepHelpers

  def post_peep(user, text)
    sign_in_as(user)
    click_button 'New peep'
    fill_in 'text', with: text
    click_button 'Post peep'
  end

end