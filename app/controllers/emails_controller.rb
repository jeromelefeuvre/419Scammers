class EmailsController < ResourceController::Base
  require_role :admin, :for => [:edit, :update, :destroy]
  
  index.response do |wants|
    wants.html do
      if @scammer_email
        if @scammer_email.errors.on(:email)
          flash[:warning] = "Invalid email : #{params[:search][:email]}"
        else
          flash[:notice] = "Email non trouvé" if collection.empty?
        end
      end
    end
  end
  
  create.wants.html {redirect_to emails_path}
  update.wants.html {redirect_to emails_path}

  private
    def collection
      if logged_in?
        @collection = Email.search(params[:search]).all
      else
        if params[:search]
          if params[:search][:email]
            @scammer_email = Email.new(:email => params[:search][:email])
            @scammer_email.valid?
          end
        end

        if @scammer_email
          unless @scammer_email.errors.on(:email)
            @collection = Email.email_is(params[:search][:email]).all
          end
        end
        
      end
    end
end
