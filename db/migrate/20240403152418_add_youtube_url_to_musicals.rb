class AddYoutubeUrlToMusicals < ActiveRecord::Migration[6.1]
  def change
    add_column :musicals, :youtube_url, :string
    add_column :musicals, :point, :text
    
  end
end
