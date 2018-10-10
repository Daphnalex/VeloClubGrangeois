require 'test_helper'

class AlbumAttachmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @album_attachment = album_attachments(:one)
  end

  test "should get index" do
    get album_attachments_url
    assert_response :success
  end

  test "should get new" do
    get new_album_attachment_url
    assert_response :success
  end

  test "should create album_attachment" do
    assert_difference('AlbumAttachment.count') do
      post album_attachments_url, params: { album_attachment: { album_id: @album_attachment.album_id, picture: @album_attachment.picture } }
    end

    assert_redirected_to album_attachment_url(AlbumAttachment.last)
  end

  test "should show album_attachment" do
    get album_attachment_url(@album_attachment)
    assert_response :success
  end

  test "should get edit" do
    get edit_album_attachment_url(@album_attachment)
    assert_response :success
  end

  test "should update album_attachment" do
    patch album_attachment_url(@album_attachment), params: { album_attachment: { album_id: @album_attachment.album_id, picture: @album_attachment.picture } }
    assert_redirected_to album_attachment_url(@album_attachment)
  end

  test "should destroy album_attachment" do
    assert_difference('AlbumAttachment.count', -1) do
      delete album_attachment_url(@album_attachment)
    end

    assert_redirected_to album_attachments_url
  end
end
