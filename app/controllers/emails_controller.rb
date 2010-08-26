class EmailsController < ResourceController::Base
  require_role :admin, :for => [:edit, :update, :destroy]
  
  index.before do
    if params[:scammer_email]
      collection = Email.email_is(params[:scammer_email])
    end
  end
end
