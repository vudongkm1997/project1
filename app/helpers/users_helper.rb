module UsersHelper
  def admin_user
    return if current_user.admin?
    redirect_to root_path
  end
end
