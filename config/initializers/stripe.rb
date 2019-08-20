Rails.configuration.stripe = {
    :publishable_key => 'pk_test_JSQEwtiZRyNjvArjmMRUF4gY00lClfgxzp',
    :secret_key      => 'sk_test_bVK38Q074164JiLvbHRw550j004KuWodLb'
  }
  
  Stripe.api_key = Rails.configuration.stripe[:secret_key]