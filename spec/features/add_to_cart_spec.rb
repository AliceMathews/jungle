require "rails_helper"

RSpec.feature "AddToCarts", type: :feature, js: true do
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

  scenario "User can add item to cart" do
    visit root_path
    nav = page.find(".navbar-right")
    expect(nav).to have_content("My Cart (0)")

    product = first("article.product")
    product.find("button", :text => /\AAdd\z/).click

    nav = page.find(".navbar-right")
    expect(nav).to have_content("My Cart (1)")
  end
end
