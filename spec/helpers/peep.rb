module SessionHelpers
  def create_peep(user)
    visit "/users/#{user.id}/peeps/new"
    fill_in 'content', with: 'Que sera sera'
    click_button 'Chitter'
  end
end
