class CreateSocials < ActiveRecord::Migration
  def change
    create_table :socials do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :token
      t.string :secret
      t.datetime :expires_at
    end
  end
end
