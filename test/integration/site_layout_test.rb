require 'test_helper'
class SiteLayoutTest < ActionDispatch::IntegrationTest

  # 1)  выполнить переход по корневому маршруту (страница Home);
  # 2) убедиться, что возвращается правильная страница;
  # 3) проверить корректность ссылок на страницы Home, Help, About и Contact.

  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
  end
end
