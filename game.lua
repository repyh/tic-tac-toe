require("functions");
Game = {}

function Game:load()
    board = {{"", "", ""}, {"", "", ""}, {"", "", ""}};
    buttons = {{}, {}, {}};
    player1 = "x";
    player2 = "o";
    turn = player1;
    screen = {
        height = love.graphics.getHeight(),
        width = love.graphics.getHeight()
    };
    canRun = true;
end

function Game:update()
    if canRun ~= true then return end;
    for i = 1, getTableLength(buttons), 1 do
        for e = 1, getTableLength(buttons[i]), 1 do
            local butt = buttons[e][i];
            local mx, my = love.mouse.getPosition();
            if checkForCollision(mx, my, 20, 20, butt.x, butt.y, butt.width, butt.height) and love.mouse.isDown(1) then
                if board[e][i] ~= "" then return end;
                board[e][i] = turn;
                if turn == "x" then turn = player2 else turn = player1 end;
                mouse = 5;
            end
        end
    end
    if checkWinCondition(board) ~= nil then
        print(checkWinCondition(board));
        canRun = false;
    end
end

function Game:draw()
    font = love.graphics.newFont("04B_30__.ttf", 64)
    love.graphics.setFont(font)
    -- Draw board outline
    love.graphics.rectangle("fill", 0, 200-5, screen.width, 10)
    love.graphics.rectangle("fill", 0, 400-5, screen.width, 10)
    love.graphics.rectangle("fill", 200-5, 0, 10, screen.height)
    love.graphics.rectangle("fill", 400-5, 0, 10, screen.height)
    -- Draw board's contents
    for i = 1, getTableLength(board), 1 do
        for e = 1, getTableLength(board[i]), 1 do
            buttons[e][i] = {x = (200*i)-175, y = (200*e)-175, width = 150, height = 150};
            love.graphics.setColor(156, 256, 256, 0)
            local butt = buttons[e][i];
            local mx, my = love.mouse.getPosition();
            if buttons[e][i] and checkForCollision(mx, my, 20, 20, butt.x, butt.y, butt.width, butt.height) then
                love.graphics.setColor(156, 256, 256, .1)
            end
            love.graphics.rectangle("fill", (200*i)-175, (200*e)-175, 150, 150)
            --
            love.graphics.setColor(256, 256, 256);
            love.graphics.print(board[e][i], (200*i)-126, (200*e)-126, 0, 1)
        end
    end
    -- Menu?
    if canRun == false then
        love.graphics.setColor(0, 0, 0, 1)
        love.graphics.rectangle("fill", 0, 0, screen.width, screen.height);
        if checkWinCondition(board) == "tie" then
            love.graphics.setColor(256, 256, 256)
            love.graphics.print("Tie!", 220, screen.height/2.5)
        else
            love.graphics.setColor(256, 256, 256)
            love.graphics.print(checkWinCondition(board) .. " won!", 165, screen.height/2.5)
        end
    end
end