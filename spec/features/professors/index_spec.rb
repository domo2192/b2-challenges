require 'rails_helper'

RSpec.describe 'Professor index page' do
  before :each do
    Professor.destroy_all
    @mcgonagall = Professor.create!(name: "Minerva McGonagall", age: 204, specialty: "Transfiguration")
    @lupin = Professor.create!(name: "Remus Lupin", age: 45, specialty: "Defence Against the Dark Arts")
    @snape = Professor.create!(name: "Severus Snape", age: 45, specialty: "Potions")
  end

  it "displays a link to each professors show page" do

    visit "/professors"

    expect(page).to have_link(@mcgonagall.name)
    expect(page).to have_link(@lupin.name)
    expect(page).to have_link(@snape.name)
  end

  it "displays an update professor link" do
    visit "/professors"
    expect(page).to have_link("Update #{@mcgonagall.name}")
    expect(page).to have_link("Update #{@lupin.name}")
    expect(page).to have_link("Update #{@snape.name}")
    first(:link, "Update #{@mcgonagall.name}").click
    expect(current_path).to eq("/professors/#{@mcgonagall.id}/edit")
  end

  it "displays a form to update professors" do
    visit "/professors/#{@mcgonagall.id}/edit"
    fill_in 'professor[name]', with: 'New Professor'
    fill_in 'professor[age]', with: 1200
    fill_in 'professor[specialty]', with: "Potions"
    click_on "Update Professor"
    visit "/professors/#{@mcgonagall.id}"
    expect(page).to have_content('New Professor')
    expect(page).to have_content(1200)
    expect(page).to have_content("Potions")
  end
end
