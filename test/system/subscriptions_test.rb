require "application_system_test_case"

class SubscriptionsTest < ApplicationSystemTestCase
  setup do
    @subscription = subscriptions(:one)
  end

  test "visiting the index" do
    visit subscriptions_url
    assert_selector "h1", text: "Subscriptions"
  end

  test "creating a Subscription" do
    visit subscriptions_url
    click_on "New Subscription"

    fill_in "Charge", with: @subscription.charge_id
    fill_in "Customer", with: @subscription.customer_id
    fill_in "Error message", with: @subscription.error_message
    fill_in "Payment gateway", with: @subscription.payment_gateway
    fill_in "Price", with: @subscription.price
    fill_in "Status", with: @subscription.status
    fill_in "Supporter level", with: @subscription.supporter_level_id
    fill_in "Token", with: @subscription.token
    fill_in "User", with: @subscription.user_id
    click_on "Create Subscription"

    assert_text "Subscription was successfully created"
    click_on "Back"
  end

  test "updating a Subscription" do
    visit subscriptions_url
    click_on "Edit", match: :first

    fill_in "Charge", with: @subscription.charge_id
    fill_in "Customer", with: @subscription.customer_id
    fill_in "Error message", with: @subscription.error_message
    fill_in "Payment gateway", with: @subscription.payment_gateway
    fill_in "Price", with: @subscription.price
    fill_in "Status", with: @subscription.status
    fill_in "Supporter level", with: @subscription.supporter_level_id
    fill_in "Token", with: @subscription.token
    fill_in "User", with: @subscription.user_id
    click_on "Update Subscription"

    assert_text "Subscription was successfully updated"
    click_on "Back"
  end

  test "destroying a Subscription" do
    visit subscriptions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Subscription was successfully destroyed"
  end
end
