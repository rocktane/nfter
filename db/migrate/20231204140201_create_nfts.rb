class CreateNfts < ActiveRecord::Migration[7.1]
  def change
    create_table :nfts do |t|
      t.string :name, null: false, default: ""
      t.integer :price, null: false, default: ""
      t.boolean :availability, null: false, default: true
      t.text :description, null: false, default: ""
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
