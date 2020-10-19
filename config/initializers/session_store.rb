if Rails.env == "production"
        Rails.application.config.session_store :cookie_store, key: '_gomojii', domain: 'https://gomojii.com/'
else
        Rails.application.config.session_store :cookie_store, key: '_gomojii'
end