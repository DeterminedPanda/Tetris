field = {
                { nil, nil, nil, nil, nil, nil, nil, nil, nil, nil },
                { nil, nil, nil, nil, nil, nil, nil, nil, nil, nil },
                { nil, nil, nil, nil, nil, nil, nil, nil, nil, nil },
                { nil, nil, nil, nil, nil, nil, nil, nil, nil, nil },
                { nil, nil, nil, nil, nil, nil, nil, nil, nil, nil },
                { nil, nil, nil, nil, nil, nil, nil, nil, nil, nil },
                { nil, nil, nil, nil, nil, nil, nil, nil, nil, nil },
                { nil, nil, nil, nil, nil, nil, nil, nil, nil, nil },
                { nil, nil, nil, nil, nil, nil, nil, nil, nil, nil },
                { nil, nil, nil, nil, nil, nil, nil, nil, nil, nil },
                { nil, nil, nil, nil, nil, nil, nil, nil, nil, nil },
                { nil, nil, nil, nil, nil, nil, nil, nil, nil, nil },
                { nil, nil, nil, nil, nil, nil, nil, nil, nil, nil },
                { nil, nil, nil, nil, nil, nil, nil, nil, nil, nil },
                { nil, nil, nil, nil, nil, nil, nil, nil, nil, nil },
                { nil, nil, nil, nil, nil, nil, nil, nil, nil, nil },
                { nil, nil, nil, nil, nil, nil, nil, nil, nil, nil },
                { nil, nil, nil, nil, nil, nil, nil, nil, nil, nil },
                { nil, nil, nil, nil, nil, nil, nil, nil, nil, nil },
                { nil, nil, nil, nil, nil, nil, nil, nil, nil, nil },
                { nil, nil, nil, nil, nil, nil, nil, nil, nil, nil },
                { nil, nil, nil, nil, nil, nil, nil, nil, nil, nil }
}

-- fills the table with placeholder blocks
function fillTable()
    local x = 0
    local y = 0
    for i = 1, field_height do
        for j = 1, field_width do
            empty_block = EmptyBlock(x, y, block_size - 1, block_size - 1)
            field[i][j] = empty_block 
            x = x + block_size
        end
        x = 0
        y = y + block_size
    end
end