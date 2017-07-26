class Backoffice::AdminsController < BackofficeController
  before_action :set_admin, only: [:edit, :update]
  
  def index
    @admins = Admin.all
  end

  def new
    @category = Admin.new
    authorize @admin
  end

  def create
    @admin = Admin.new(params_admin)
    if @admin.save 
      redirect_to backoffice_categories_path, notice: "O administrador (#{@admin.email}) foi cadastrada com sucesso"
    else
      render :new
    end
  end

  def edit
  end

  def update
    passwd = params[:admin][:password]
    passwd_confimation = params[:admin][:password_confirmation]

    if passwd.blank? && passwd_confimation.blank?
      params[:admin].delete(:password)
      params[:admin].delete(:password_confirmation)
    end

    if @admin.update(params_admin)
      redirect_to backoffice_categories_path, notice: "A administrador (#{@admin.email}) foi atualizada com sucesso"  
    else
      render :edit
    end
  end

  private

  def set_admin
    @admin = Admin.find(params[:id])
  end

  def params_category
    params.require(:admin).permit(:email, :password, :password_confirmation)
  end
end
