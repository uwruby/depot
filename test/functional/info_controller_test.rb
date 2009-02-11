require 'test_helper'
require 'nokogiri'

class InfoControllerTest < ActionController::TestCase
  test "xml format" do
    @request.session[:user_id] = users(:one).id
    get :who_bought, :id => products(:one).id,
      :format => 'xml'

    doc = Nokogiri::XML(@response.body)
    assert_equal 1, doc.xpath('/product').length
  end

  test "json format" do
    @request.session[:user_id] = users(:one).id
    get :who_bought, :id => products(:one).id,
      :format => 'json'

    doc = ActiveSupport::JSON.decode(@response.body)
    assert doc['product']
    assert doc['product']['title']
    assert_equal assigns(:product).title, doc['product']['title']
  end
end
