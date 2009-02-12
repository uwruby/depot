#---
# Excerpted from "Agile Web Development with Rails, 3rd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails3 for more book information.
#---
require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test "store controller is localized" do
    locale = LANGUAGES.to_a.first.last
    @request.session[:user_id] = users(:one).id
    get :index, :locale => locale

    translations = YAML.load_file("#{LOCALES_DIRECTORY}#{locale}.yml")

    assert_match translations[locale]['layout']['side']['questions'],
      @response.body
  end
end
