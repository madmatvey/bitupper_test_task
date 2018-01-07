class CreateBlocks < ActiveRecord::Migration[5.0]
  def change
    create_table :blocks, id: false, primary_key: :blhash do |t|
      t.string :blhash, null: false
      t.jsonb :bldata, null: false, default: '{}'

      t.timestamps null: false
    end
    add_index  :blocks, :bldata, using: :gin
    add_index  :blocks, :blhash, unique: true
  end
end
