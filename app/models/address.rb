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
  end
end
