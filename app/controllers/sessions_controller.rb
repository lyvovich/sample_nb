class SessionsController < ApplicationController

	def new
		@title="Sign in"
	end

	def create
		user=User.authenticate(params[:session][:email],
							params[:session][:password])
		if user.nil?
			#создание сообщения об ошибке и повторное воспроизведение формы входа
			flash.now[:error]="Invalid email/password combination."
			@title="Sign in"
			render 'new'
		else
			#вход пользователя в систему и переадресациях к странице показывающей пользователя
		sign_in user
			redirect_to user
		end
  end

	def destroy
		sign_out
		redirect_to root_path
	end
end
