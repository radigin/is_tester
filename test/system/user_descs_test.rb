require "application_system_test_case"

class UserDescsTest < ApplicationSystemTestCase
  setup do
    @user_desc = user_descs(:one)
  end

  test "visiting the index" do
    visit user_descs_url
    assert_selector "h1", text: "User descs"
  end

  test "should create user desc" do
    visit user_descs_url
    click_on "New user desc"

    fill_in "Address", with: @user_desc.address
    fill_in "Fname", with: @user_desc.fname
    fill_in "Lname", with: @user_desc.lname
    fill_in "Sname", with: @user_desc.sname
    fill_in "User", with: @user_desc.user_id
    click_on "Create User desc"

    assert_text "User desc was successfully created"
    click_on "Back"
  end

  test "should update User desc" do
    visit user_desc_url(@user_desc)
    click_on "Edit this user desc", match: :first

    fill_in "Address", with: @user_desc.address
    fill_in "Fname", with: @user_desc.fname
    fill_in "Lname", with: @user_desc.lname
    fill_in "Sname", with: @user_desc.sname
    fill_in "User", with: @user_desc.user_id
    click_on "Update User desc"

    assert_text "User desc was successfully updated"
    click_on "Back"
  end

  test "should destroy User desc" do
    visit user_desc_url(@user_desc)
    click_on "Destroy this user desc", match: :first

    assert_text "User desc was successfully destroyed"
  end
end
