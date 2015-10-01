FactoryGirl.define do
  factory :auth, class: OmniAuth::AuthHash do
    skip_create

    provider "google_oauth2"
    uid { Faker::Number.decimal(9).to_s }

    info do
      {
        name:"Joe Bloggs"
      }
    end

    credentials do
      {
        token: Faker::Lorem.characters(100),
        expires_at: Faker::Number.decimal(9).to_i
      }
    end
  end
end
