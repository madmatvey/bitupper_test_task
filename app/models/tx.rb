class Tx < ApplicationRecord
  self.primary_key = 'txhash'

  def showtx
    Bitcoin::P::Tx.from_hash(self.txdata)
  end
end
