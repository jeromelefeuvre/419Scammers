class EmailsController < ResourceController::Base
  require_role :admin, :for => [:edit, :update, :destroy]
end
