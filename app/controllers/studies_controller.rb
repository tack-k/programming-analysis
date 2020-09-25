class StudiesController < ApplicationController

  def index

  end

  def analysis
    @analysis1 = Analysis.find(1)
    @analysis2 = Analysis.find(2)
    @analysis3 = Analysis.find(3)
  end
end
