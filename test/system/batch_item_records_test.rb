require "application_system_test_case"

class BatchItemRecordsTest < ApplicationSystemTestCase
  setup do
    @batch_item_record = batch_item_records(:one)
  end

  test "visiting the index" do
    visit batch_item_records_url
    assert_selector "h1", text: "Batch item records"
  end

  test "should create batch item record" do
    visit batch_item_records_url
    click_on "New batch item record"

    fill_in "Content", with: @batch_item_record.content
    fill_in "Section", with: @batch_item_record.section_id
    click_on "Create Batch item record"

    assert_text "Batch item record was successfully created"
    click_on "Back"
  end

  test "should update Batch item record" do
    visit batch_item_record_url(@batch_item_record)
    click_on "Edit this batch item record", match: :first

    fill_in "Content", with: @batch_item_record.content
    fill_in "Section", with: @batch_item_record.section_id
    click_on "Update Batch item record"

    assert_text "Batch item record was successfully updated"
    click_on "Back"
  end

  test "should destroy Batch item record" do
    visit batch_item_record_url(@batch_item_record)
    click_on "Destroy this batch item record", match: :first

    assert_text "Batch item record was successfully destroyed"
  end
end
