class CreateDresses < ActiveRecord::Migration[6.0]
  def change
    create_table :dresses do |t|
      t.string :name, null: false, default: ""
      t.string :color
      t.string :size
      t.text :description
      t.decimal :price

      t.timestamps
    end
  end
end
