class CreateChirrups < ActiveRecord::Migration[5.2]
  def change
    create_table :chirrups do |chirrup|
      chirrup.string :content
      chirrup.timestamps
    end
  end
end
