class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.string :name
      t.boolean :public, default: true
      t.text :description
      add_column :topic_id, :integer

      t.timestamps
    end
  end
end
