class TestsController < ApplicationController
  def new
    @test = Test.new
  end
  def create
    test = Test.create(params.require(:test).permit(:name,:number))
  end
end
