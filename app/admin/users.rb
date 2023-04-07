ActiveAdmin.register User do

    # See permitted parameters documentation:
    # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
    #
    # Uncomment all parameters which should be permitted for assignment
    #
    # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :user_name, :user_photo
    #
    # or
    #
    # permit_params do
    #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :user_name, :user_photo]
    #   permitted << :other if params[:action] == 'create' && current_user.admin?
    #   permitted
    # end

    permit_params :collectionist_name, :email, :user_id, :role

    index do
          column 'Name', :collectionist_name

          column 'Role' do |user|
               user.role.to_s
            end

          
  
          actions
     end
 
    
end 
    