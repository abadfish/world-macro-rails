class Users::RegistrationsController < Devise::RegistrationsController

before_action :configure_sign_up_params, only: [:create]
# before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new

    @stripe_list = Stripe::Plan.all
    @plans = @stripe_list[:data]
    super
  end
  # POST /resource
  def create
    super
    user = resource
    @stripe_list = Stripe::Plan.all
    @plans = @stripe_list[:data]
    @plan = @plans.find { |plan| plan.id == user.plan_id}
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken],
      :plan => user.plan_id
    )

    charge = Stripe::Charge.create(
       :customer    => customer.id,
       :amount      => @plan.amount,
       :description => 'Standard Subscription',
       :currency    => 'usd'
     )

    user.subscribed = true
    # user.stripeid = customer.id
    user.stripe_card_token = customer.id
    user.save

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:plan_id])
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
    # devise_parameter_sanitizer.permit(:account_update, keys: [:plan_id])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
