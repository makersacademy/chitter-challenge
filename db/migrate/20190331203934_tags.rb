class Tags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.column :content, :string
    end

    execute <<-SQL
    ALTER TABLE tags
    ADD CONSTRAINT fk_id
    FOREIGN KEY (id)
    REFERENCES users(id)
    SQL
  end
end
