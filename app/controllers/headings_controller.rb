class HeadingsController < ApplicationController

  def index
    headings_list = [{id:1,title:"heading1",heading_level:0},{id:2,title:"heading2",heading_level:2},{id:3,title:"heading3",heading_level:1},{id:4,title:"heading4",heading_level:1}]
    @headings = helpers.headings(headings_list)
  end

end
