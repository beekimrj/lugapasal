class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username, null: false, default: ""
      t.string :password_digest, null: false, default: ""
      t.string :full_name, null: false, default: ""

      t.timestamps
    end
  end
end
