class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DeviseWhitelist
  include SetSource
  include CurrentUserConcern
  include DefaultPageContent
  before_action :set_copy_right

  def set_copy_right
    @copyright = DevViewTool::Renderer.copyright 'Linh Tran', 'All rights reserved'
  end
end

module DevViewTool
  class Renderer
    def self.copyright name, msg
      "&copy; #{Time.now.year} | <b>#{name}</b> #{msg}".html_safe
    end
  end
end