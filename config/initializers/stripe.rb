Rails.configuration.stripe = {
  :publishable_key => 'pk_test_vtbEFJiHIlbMCjQU6XIpHOon',
  :secret_key      => 'sk_test_hq6mBKXL38IXnCHZmtgy6NR2'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
