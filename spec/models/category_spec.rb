require 'spec_helper'

describe Category do
  describe "Params" do
  	it "shold have a title" do
  		category = Category.new
  		category.should respond_to(:title)
  	end
  	  	it "shold have a status" do
  		category = Category.new
  		category.should respond_to(:status)
  	end
  end
  describe "Validation" do
  	before(:each) do
  		@valid_params= {title: "Category 1", status: 1}
  	end
  		it "should not have cateogry without title" do
  			category = Category.new(@valid_parmas.merge({title:''}))
  			category.save.should be_false
  		end

  end
end
