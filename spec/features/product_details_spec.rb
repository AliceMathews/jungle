require "rails_helper"

RSpec.feature "Visitor can view a product detail page", type: :feature, js: true do
  #SETUP
  before :each do
    @category = Category.create! name: "Apparel"
    # @product = Product.create!(name: "dghad", description: "gfadsga", quantity: 10, price: 435, category: @category)

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset("apparel1.jpg"),
        quantity: 10,
        price: 64.99,
      )
    end
  end

  scenario "They see product detail" do
    visit root_path

    product = first("article.product")
    product.find("img").click

    find(".products-show")

    save_screenshot

    expect(page).to have_css ".products-show"
  end
end
