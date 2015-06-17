#sample test file, just 3 tests here
#did not create one for recipes but you get the idea
#run rake:test to run all test files

require 'test_helper'

class ChefTest < ActiveSupport::TestCase
   
   #lets create a chef we can test with
   def setup
      @chef = Chef.create(
          :chefname => "Bob Smith", 
          :email => "bobsmith@cooksmart.com" 
    ) 
   end
   
   test "chefname should be present" do
       @chef.chefname = ""
       assert_not @chef.valid?
   end
   
   test "email should conform to email standards" do
      @chef.email = "bob@bobsplacecom"
      assert_not @chef.valid?
   end
   
   test "chefname must not exceed 50 characters" do
      @chef.chefname = "abc" * 20; 
      assert_not @chef.valid?
   end
    
end