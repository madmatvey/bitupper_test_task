class Block < ApplicationRecord
  self.primary_key = 'blhash'
  has_many :txes, primary_key: :blhash
  def showbl
    Bitcoin::P::Block.from_hash(self.bldata)
  end

  def orphane?
    orphane=false
    self.bldata["tx"].map { |tx| Bitcoin::P::Tx.from_hash(tx,false).hash != tx["hash"]? orphane=true : nil }
    orphane
  end

  def total_value
    sum = 0
    self.showbl.tx.map { |tx| tx.outputs.map { |e| sum+=e.value } }
    sum
  end
end
