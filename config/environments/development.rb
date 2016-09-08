Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Asset digests allow you to set far-future HTTP expiration dates on all assets,
  # yet still be able to expire them through the digest params.
  config.assets.digest = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true
  Paperclip.options[:command_path] = "/usr/local/bin/convert"

  config.paperclip_defaults = {
  storage: :s3,
    s3_credentials: {
      bucket: ENV.fetch('elasticbeanstalk-us-east-1-471698247213'),
      access_key_id: ENV.fetch('AKIAJP4NVRZEAEP36A6Q'),
      secret_access_key: ENV.fetch('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'),
      s3_region: ENV.fetch('us-east-1'),
    }
  }
end
