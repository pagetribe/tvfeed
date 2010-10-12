# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_tvfeed_session',
  :secret      => 'de521daad9119395edb607c50424b86884c4fba5fc1d3807bce3163d84f2c17922b88f949473b1a9ceb0e0fd4b907f9dc2e251099027aabce33aa27e4accaacc'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
