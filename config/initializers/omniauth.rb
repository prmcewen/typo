require 'omniauth-facebook'
require 'koala'

TypoBlog::Application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '396834053675244', '3c74a0ca755564c79997fdcca8e592c6',
  	   :scope => 'manage_pages,create_event'
  provider :twitter, 'OJzXHrmXGUFQZGyQIN90kw', '1Xalapvsqawb2dwTbCUgb2eTe3gcc9rtfNrCB2FDg',
           :use_authorize => 'true'
end
