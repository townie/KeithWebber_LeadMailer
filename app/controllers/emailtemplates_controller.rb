class EmailtemplatesController < ApplicationController
  def index
    @templates = Emailtemplate.all
  end
end
