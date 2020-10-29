require "application_system_test_case"

class CoresTest < ApplicationSystemTestCase
  setup do
    @core = cores(:one)
  end

  test "visiting the index" do
    visit cores_url
    assert_selector "h1", text: "Cores"
  end

  test "creating a Core" do
    visit cores_url
    click_on "New Core"

    fill_in "Homepage content", with: @core.homepage_content
    fill_in "Homepage image", with: @core.homepage_image
    check "Homepage published" if @core.homepage_published
    click_on "Create Core"

    assert_text "Core was successfully created"
    click_on "Back"
  end

  test "updating a Core" do
    visit cores_url
    click_on "Edit", match: :first

    fill_in "Homepage content", with: @core.homepage_content
    fill_in "Homepage image", with: @core.homepage_image
    check "Homepage published" if @core.homepage_published
    click_on "Update Core"

    assert_text "Core was successfully updated"
    click_on "Back"
  end

  test "destroying a Core" do
    visit cores_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Core was successfully destroyed"
  end
end
