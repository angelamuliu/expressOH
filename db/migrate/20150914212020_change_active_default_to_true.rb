class ChangeActiveDefaultToTrue < ActiveRecord::Migration

    def up
        change_column_default :requests, :active, true
    end

    def down
        change_column_default :requests, :active, nil
    end
end
