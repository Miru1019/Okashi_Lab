# frozen_string_literal: true

class Public::RegistrationsController < Devise::RegistrationsController
    protected
  
    # サインアップ後にマイページへリダイレクト
    def after_sign_up_path_for(resource)
      mypage_users_path
    end
  end
  
