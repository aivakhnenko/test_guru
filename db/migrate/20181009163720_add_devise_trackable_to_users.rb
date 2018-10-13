# frozen_string_literal: true

class AddDeviseTrackableToUsers < ActiveRecord::Migration[5.2]
  def self.up
    change_table :users do |t|
      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip
    end
  end

  def self.down
    remove_columns(:users,  :sign_in_count, :current_sign_in_at, :last_sign_in_at, 
                            :current_sign_in_ip, :last_sign_in_ip)
  end
end
