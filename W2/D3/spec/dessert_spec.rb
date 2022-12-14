require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  ingrds = %w(sugar coffee vanilla)

  # setting necessary but not tested
  let(:chef) { double("chef") }

  # set main var
  subject(:dessert) {Dessert.new("cookie",10, chef)}



  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("cookie")
    end

    it "sets a quantity" do
      expect(dessert.quantity).to be(10)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect{ Dessert.new("cookie","and",chef) }.to raise_error(ArgumentError)
    end
  end

  context "#add_ingredient" do
    before(:each) {dessert.add_ingredient(ingrds[0])}

    it "adds an ingredient to the ingredients array" do
      expect(dessert.ingredients).to include(ingrds[0])
    end
  end

  context "#mix!" do
    before(:each) {dessert.add_ingredient(ingrds[1..-1])}

    it "shuffles the ingredient array" do
      expect(dessert.ingredients).to_not be(ingrds)
    end
  end

  context "#eat" do
    before(:each) {dessert.eat(1)} # init'd to 10

    it "subtracts an amount from the quantity" do
      expect(dessert.quantity).to be(9)
    end

    it 'does not raise an error if there are any left to be eaten' do
      expect {dessert.eat(8)}.not_to raise_error
    end

    it 'properly adjusts the quanity after eating' do
      expect(dessert.quantity).to eq(9)
    end

    it "raises error if the amount removed is >= the quantity" do
      expect {dessert.eat(10)}.to raise_error("not enough left!")
    end
  end

  context "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Bob the Great Baker")
      expect(dessert.serve).to eq("Chef Bob the Great Baker has made 10 cookies!")
    end
  end

  context "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(dessert)
      dessert.make_more
    end
  end
end
