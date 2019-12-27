class ApplicationController < ActionController::Base
  ActiveRecord::Base.include_root_in_json = true
end
