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

  def set_relate_txs
    unless self.orphane?
      self.showbl.tx.map{ |tx|
        find_tx = Tx.where(txhash: tx.hash).take
        unless find_tx
          find_tx = Tx.new
          find_tx.txhash = tx.hash
          find_tx.txdata = tx.to_hash
          find_tx.save
        end
        self.txes << find_tx
      }
    end
  end

  def tx_hashes
    unless self.orphane?
      self.showbl.tx_hashes
    else
      self.bldata["tx"].map{|tx|tx["hash"]}
    end
  end

  def tx_hash_at_this_block?(txhash)
    self.bldata["tx"].map{|tx|tx["hash"]}.include?(txhash)
  end

  def self.get_by_tx_hash(txhash)
    Block.where("'{\"hash\": \"#{txhash}\" }' <@ ANY (ARRAY(select jsonb_array_elements(bldata -> 'tx')))")
  end
end
