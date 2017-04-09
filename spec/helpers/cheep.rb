module CheepHelpers

  DEFAULT_MESSAGE = "Never Going to Give You Up"

  def post_cheep(message: DEFAULT_MESSAGE)
    visit 'rolls/new'
    fill_in('new_cheep', with: message)
    click_button 'Roll'

  end

end
