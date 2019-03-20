class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
				 :recoverable, :rememberable, :validatable


	protected

	enum role: { registered: 0, subscriber: 1, journalist: 2 }
end
