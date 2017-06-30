PagSeguro.configure do |config|
  config.email        = Rails.application.secrets.PAGSEGURO_EMAIL
  config.token        = Rails.application.secrets.PAGSEGURO_TOKEN

  if Rails.env.production?
    config.environment  = :production
  else
    config.environment  = :sandbox
  end

  config.encoding     = "UTF-8" # ou "ISO-8859-1"
  # config.timeout = 90
end