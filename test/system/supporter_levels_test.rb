require "application_system_test_case"

class SupporterLevelsTest < ApplicationSystemTestCase
  setup do
    @supporter_level = supporter_levels(:one)
  end

  test "visiting the index" do
    visit supporter_levels_url
    assert_selector "h1", text: "Supporter Levels"
  end

  test "creating a Supporter level" do
    visit supporter_levels_url
    click_on "New Supporter Level"

    fill_in "Ammount", with: @supporter_level.ammount
    fill_in "Name", with: @supporter_level.name
    click_on "Create Supporter level"

    assert_text "Supporter level was successfully created"
    click_on "Back"
  end

  test "updating a Supporter level" do
    visit supporter_levels_url
    click_on "Edit", match: :first

    fill_in "Ammount", with: @supporter_level.ammount
    fill_in "Name", with: @supporter_level.name
    click_on "Update Supporter level"

    assert_text "Supporter level was successfully updated"
    click_on "Back"
  end

  test "destroying a Supporter level" do
    visit supporter_levels_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Supporter level was successfully destroyed"
  end
end
