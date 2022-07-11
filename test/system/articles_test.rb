require "application_system_test_case"

class ArticlesTest < ApplicationSystemTestCase
  setup do
    @article = articles(:one)
  end

  test "visiting the index" do
    visit articles_url
    assert_selector "h1", text: "Articles"
  end

  test "should create article" do
    visit articles_url
    click_on "New article"

    fill_in "Barcode", with: @article.barcode
    fill_in "Brand", with: @article.brand_id
    fill_in "Category", with: @article.category_id
    fill_in "Description", with: @article.description
    fill_in "Name", with: @article.name
    fill_in "Price", with: @article.price
    check "Published" if @article.published
    fill_in "Sku", with: @article.sku
    fill_in "Slug", with: @article.slug
    fill_in "Stock", with: @article.stock
    fill_in "Subcategory", with: @article.subcategory_id
    check "Visible" if @article.visible
    click_on "Create Article"

    assert_text "Article was successfully created"
    click_on "Back"
  end

  test "should update Article" do
    visit article_url(@article)
    click_on "Edit this article", match: :first

    fill_in "Barcode", with: @article.barcode
    fill_in "Brand", with: @article.brand_id
    fill_in "Category", with: @article.category_id
    fill_in "Description", with: @article.description
    fill_in "Name", with: @article.name
    fill_in "Price", with: @article.price
    check "Published" if @article.published
    fill_in "Sku", with: @article.sku
    fill_in "Slug", with: @article.slug
    fill_in "Stock", with: @article.stock
    fill_in "Subcategory", with: @article.subcategory_id
    check "Visible" if @article.visible
    click_on "Update Article"

    assert_text "Article was successfully updated"
    click_on "Back"
  end

  test "should destroy Article" do
    visit article_url(@article)
    click_on "Destroy this article", match: :first

    assert_text "Article was successfully destroyed"
  end
end
