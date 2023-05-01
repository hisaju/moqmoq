class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.string :title
      t.string :image
      t.string :place
      t.datetime :start_at
      t.text :description
      t.timestamps
    end
  end
end
