function getTableLength(table)
    local length = 0;
    for _ in pairs(table) do
        length = length+1;
    end
    return length;
end

function checkForCollision(mX, mY, mW, mH, sX, sY, sW, sH)
    if mX+mW > sX and mX < sX+sW and mY+mH > sY and mY < sY+sH then
        return true
    end
        return false
end

function checkWinCondition(board)
    -- Horizontal
    if board[1][1] == "x" and board[1][2] == board[1][1] and board[1][3] == board[1][1] then return "x" end;
    if board[2][1] == "x" and board[2][2] == board[2][1] and board[2][3] == board[2][1] then return "x" end;
    if board[3][1] == "x" and board[2][3] == board[3][1] and board[3][3] == board[3][1] then return "x" end;
    if board[1][1] == "o" and board[1][2] == board[1][1] and board[1][3] == board[1][1] then return "o" end;
    if board[2][1] == "o" and board[2][2] == board[2][1] and board[2][3] == board[2][1] then return "o" end;
    if board[3][1] == "o" and board[2][3] == board[3][1] and board[3][3] == board[3][1] then return "o" end;
    -- Vertically
    if board[1][1] == "x" and board[2][1] == board[1][1] and board[3][1] == board[1][1] then return "x" end;
    if board[1][2] == "x" and board[2][2] == board[1][2] and board[3][2] == board[1][2] then return "x" end;
    if board[1][3] == "x" and board[2][3] == board[1][3] and board[3][3] == board[1][3] then return "x" end;
    if board[1][1] == "o" and board[2][1] == board[1][1] and board[3][1] == board[1][1] then return "o" end;
    if board[1][2] == "o" and board[2][2] == board[1][2] and board[3][2] == board[1][2] then return "o" end;
    if board[1][3] == "o" and board[2][3] == board[1][3] and board[3][3] == board[1][3] then return "o" end;
    -- Diagonal
    if board[1][1] == "x" and board[2][2] == board[1][1] and board[3][3] == board[1][1] then return "x" end;
    if board[3][1] == "x" and board[2][2] == board[3][1] and board[1][3] == board[3][1] then return "x" end;
    if board[1][1] == "o" and board[2][2] == board[1][1] and board[3][3] == board[1][1] then return "o" end;
    if board[3][1] == "o" and board[2][2] == board[3][1] and board[1][3] == board[3][1] then return "o" end;
    -- Tie
    if board[1][1] ~= "" and board[1][2] ~= "" and board[1][3] ~= "" and board[2][1] ~= "" and board[2][2] ~= "" and board[2][3] ~= "" and board[3][1] ~= "" and board[3][2] ~= "" and board[3][3] ~= "" then return "tie" end;
end