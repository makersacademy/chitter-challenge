module PeepsHelpers

  def create_peep(name: 'Barney',
              copy: 'Hello world')
    visit '/peeps/new'
    fill_in :name,    with: name
    fill_in :copy, with: copy
    click_button 'Peep'
  end
end
