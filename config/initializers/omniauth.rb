Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"],ENV["GOOGLE_CLIENT_SECRET"], skip_jwt: true, {
        redirect_uri:"http://localhost:3000/auth/google_oauth2/callback"
      }
  end