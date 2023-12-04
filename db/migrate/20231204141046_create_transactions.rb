class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.datetime :begin_date
      t.datetime :end_date
      t.references :nft, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
Pending      t.string :state, default: ''

      t.timestamps
    end
  end
end
