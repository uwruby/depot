#---
# Excerpted from "Agile Web Development with Rails, 3rd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails3 for more book information.
#---
require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post :create, :order => { }
    end

    assert_redirected_to order_path(assigns(:order))
  end

  test "should show order" do
    get :show, :id => orders(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => orders(:one).id
    assert_response :success
  end

  test "should update order" do
    put :update, :id => orders(:one).id, :order => { }
    assert_redirected_to order_path(assigns(:order))
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete :destroy, :id => orders(:one).id
    end

    assert_redirected_to orders_path
  end
end
