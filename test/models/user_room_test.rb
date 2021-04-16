# require 'test_helper'

# class UserRoomTest < ActiveSupport::TestCase
#   def setup
#     @room = Room.new(id: 1)
#     @user_room = UserRoom.new(user_id: users(:michael).id,
#                                     room_id: @room.id)
#   end

#   test "should be valid" do
#     assert @user_room.valid?
#   end

#   test "should require a follower_id" do
#     @user_room.user_id= nil
#     assert_not @user_room.valid?
#   end

#   test "should require a followed_id" do
#     @user_room.room_id= nil
#     assert_not @user_room.valid?
#   end
# end

#rails チュートリアル 14.4参照
