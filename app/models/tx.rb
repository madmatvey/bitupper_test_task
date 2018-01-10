class Tx < ApplicationRecord
  self.primary_key = 'txhash'
  belongs_to :block, optional: true, autosave: true
  def showtx
    Bitcoin::P::Tx.from_hash(self.txdata)
  end


end
