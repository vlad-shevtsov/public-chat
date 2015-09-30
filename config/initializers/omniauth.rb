OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '494672040692-5uulef4d7v9mafo2smlmd49ocsvuijns.apps.googleusercontent.com', '1Kr0V6IzoV9uL2UmqbXasSbx', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end
OmniAuth.config.on_failure = SessionsController.action(:failure)
