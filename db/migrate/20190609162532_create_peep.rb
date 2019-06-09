class CreatePeep < ActiveRecord::Migration[5.2]
  def change
    create_table :peeps do |t|
      t.string    :title
      t.string    :content
      t.datetime  :created_at, null: false
    end
  end
end
