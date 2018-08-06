class CreateCommentsAndVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :comments_and_votes do |t|
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
