class AddTitleToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :subtitles, :string
    add_column :comments, :songlevel, :integer
    add_column :comments, :storylevel, :integer
    add_column :comments, :likelevel, :integer
    add_column :comments, :youtube_url, :string
  
  end
end
