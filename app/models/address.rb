class Address < ApplicationRecord

  def self.generate_keys
    key = Bitcoin::generate_key
    {prvkey: key[0], pubkey: key[1]}
  end

  def pub_address
    Bitcoin::pubkey_to_address(self.pubkey)
  end
end
