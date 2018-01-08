class AddBlockToTx < ActiveRecord::Migration[5.0]
  def change

    add_reference :txes, :block, type: :string, index: true, foreign_key: false
    add_foreign_key :txes, :blocks, primary_key: :blhash

  end
end
