class CreateMaker < ActiveRecord::Migration[6.0]
  def change
    create_table :makers do |maker|
      maker.string :username
      maker.string :password
    end
  end
end
