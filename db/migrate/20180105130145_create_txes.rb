class CreateTxes < ActiveRecord::Migration[5.0]
  def change
    create_table :txes, id: false, primary_key: :txhash do |t|
      t.string :txhash, null: false
      t.jsonb :txdata, null: false, default: '{}'

      t.timestamps null: false
    end
    add_index  :txes, :txdata, using: :gin
  end
end
