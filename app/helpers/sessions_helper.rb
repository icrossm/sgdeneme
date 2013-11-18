module SessionsHelper
  
  def sign_in(user)
    cookies.permanent.signed[:remember_token] = [user.id, user.salt]
    current_user = user 
  end
  
  def current_user=(user)
    @current_user=user  
  end
  
  def current_user
    @current_user ||= user_from_remeber_token
  end
  
  def signed_in?
    !current_user.nil?
  end
  
  private
  
  def user_from_remeber_token
    User.authenticate_with_salt(*remeber_token)
  end
  
  def remeber_token
    cookies.signed[:remeber_token] || [nil,nil]
  end
end


