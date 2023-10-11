require "application_system_test_case"

class BatchSectionRecordsTest < ApplicationSystemTestCase
  setup do
    @batch_section_record = batch_section_records(:one)
  end

  test "visiting the index" do
    visit batch_section_records_url
    assert_selector "h1", text: "Batch section records"
  end

  test "should create batch section record" do
    visit batch_section_records_url
    click_on "New batch section record"

    fill_in "Content", with: @batch_section_record.content
    fill_in "Log", with: @batch_section_record.log
    fill_in "Page", with: @batch_section_record.page_id
    click_on "Create Batch section record"

    assert_text "Batch section record was successfully created"
    click_on "Back"
  end

  test "should update Batch section record" do
    visit batch_section_record_url(@batch_section_record)
    click_on "Edit this batch section record", match: :first

    fill_in "Content", with: @batch_section_record.content
    fill_in "Log", with: @batch_section_record.log
    fill_in "Page", with: @batch_section_record.page_id
    click_on "Update Batch section record"

    assert_text "Batch section record was successfully updated"
    click_on "Back"
  end

  test "should destroy Batch section record" do
    visit batch_section_record_url(@batch_section_record)
    click_on "Destroy this batch section record", match: :first

    assert_text "Batch section record was successfully destroyed"
  end
end
