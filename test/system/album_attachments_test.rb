require "application_system_test_case"

class AlbumAttachmentsTest < ApplicationSystemTestCase
  setup do
    @album_attachment = album_attachments(:one)
  end

  test "visiting the index" do
    visit album_attachments_url
    assert_selector "h1", text: "Album Attachments"
  end

  test "creating a Album attachment" do
    visit album_attachments_url
    click_on "New Album Attachment"

    fill_in "Album", with: @album_attachment.album_id
    fill_in "Picture", with: @album_attachment.picture
    click_on "Create Album attachment"

    assert_text "Album attachment was successfully created"
    click_on "Back"
  end

  test "updating a Album attachment" do
    visit album_attachments_url
    click_on "Edit", match: :first

    fill_in "Album", with: @album_attachment.album_id
    fill_in "Picture", with: @album_attachment.picture
    click_on "Update Album attachment"

    assert_text "Album attachment was successfully updated"
    click_on "Back"
  end

  test "destroying a Album attachment" do
    visit album_attachments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Album attachment was successfully destroyed"
  end
end
