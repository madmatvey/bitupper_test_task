class Address < ApplicationRecord

  def self.generate_keys
    key = Bitcoin::generate_key
    {prvkey: key[0], pubkey: key[1]}
  end

  def pub_address
    Bitcoin::pubkey_to_address(self.pubkey)
  end

  def get_txes
    # tx1.showtx.outputs[0].parsed_script.get_address - чтобы узнать в каких транзакциях был адрес
    # tx1.showtx.outputs[0].value – чтобы посчитать суммы транзакций

    select = []
    Tx.all.map { |tx| tx.showtx.outputs.map{|output| select.push(tx) if output.parsed_script.get_address == self.pub_address } }
    select
  end

  def get_outputs
    outputs = []
    get_txes.map { |tx| tx.showtx.outputs.map{|out| outputs.push(out) if out.parsed_script.get_address == self.pub_address }}
    outputs
  end

  def get_value
    value = 0
    get_outputs.map { |output| value += output.value }
    value
  end
end
