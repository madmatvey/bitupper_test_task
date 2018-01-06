json.extract! tx, :txhash, :txdata, :created_at, :updated_at
json.url tx_url(tx, format: :json)
