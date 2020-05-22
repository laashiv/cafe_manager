class CdashController < ApplicationController
  def index
    @count = 5
    render "index"
  end
end
