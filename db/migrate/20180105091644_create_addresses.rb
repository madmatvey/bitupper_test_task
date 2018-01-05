class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :prvkey
      t.string :pubkey

      t.timestamps
    end
  end
end
