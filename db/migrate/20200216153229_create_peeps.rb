class CreatePeeps < ActiveRecord::Migration[6.0]
  def change
    create_table :peeps do |p|
      p.string :content
      p.datetime :created
      p.references :user, foreign_key: true
    end
  end
end
