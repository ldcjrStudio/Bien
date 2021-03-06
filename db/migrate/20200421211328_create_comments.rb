class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :body
      t.string :text
      t.belongs_to :review, null: false, foreign_key: true

      t.timestamps
    end
  end
end
