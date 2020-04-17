padx =53
pady=122
padw =24
padh=4

function movepaddle() 
    if btn(0) then
        padx -= 3
    elseif btn(1) then
        padx +=3
    end
end

function _update()
    movepaddle()
end

function _draw()
    rectfill(0,0,128,128,3)
    rectfill(padx, pady, padx+padw, pady+padh, 15)
    circfill(ballx, bally, ballsize, 15)
end


ballx = 64
bally = 64
ballsize = 3
ballxdir = 5
ballydir = 3

padx = 53
pady = 122
padw = 24
padh = 4

function moveball()
    ballx += ballxdir
    bally += ballydir
end

function _update()
    movepaddle()
    moveball()
    bounceball()
end

function bounceball()
    if ballx < ballsize then
        ballxdir =- ballxdir
        sfx(6)
    end

    if ballx > 128 - ballsize then 
        ballxdir =- ballxdir
        sfx(6)
    end
    if bally < ballsize then 
        ballydir =- ballydir
        sfx(6)
    end
end

function bouncepaddle()
    if ballx >= padx and ballx <= padx + padw and bally > pady then
        sfx(6)
        ballydir =- ballydir
    end
end
