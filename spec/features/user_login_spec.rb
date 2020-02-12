require "rails_helper"

RSpec.feature "UserLogins", type: :feature, js: true do
  #SETUP
  before :each do
    @user = User.create!(name: "Bob", email: "bob@gmail.com", password: "password", password_confirmation: "password")
  end

  scenario "User can login" do
    visit root_path

    page.find(".navbar-right").find_link("Login").click
    fill_in "email", with: "bob@gmail.com"
    fill_in "password", with: "password"
    find("input[name='commit']").click

    nav = page.find(".navbar-right")
    expect(nav).to have_content("Signed in as")

    save_screenshot

    # nav = page.find(".navbar-right")
    # expect(nav).to have_content("My Cart (0)")

    # product = first("article.product")
    # product.find("button", :text => /\AAdd\z/).click

    # nav = page.find(".navbar-right")
    # expect(nav).to have_content("My Cart (1)")
  end
end
