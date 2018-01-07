class Block < ApplicationRecord
  self.primary_key = 'blhash'

  def showbl
    Bitcoin::P::Block.from_hash(self.bldata)
  end

  def total_value
    sum = 0
    self.showbl.tx.map { |tx| tx.outputs.map { |e| sum+=e.value } }
    sum.to_f/100000000
  end
end
