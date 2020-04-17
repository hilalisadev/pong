ballx=64
bally=64
ballsize=3
ballxdir = 5
ballydir = 3

padx =53
pady=122
padw =24
padh=4
score =0
lives=3


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
    print(score, 12,6,15)
    for i= 1, lives do
        spr(001,100,4)
    end
    print(lives, 110,6,15)
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
    loseball()
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
        score +=10
    end
end

function loseball()
    if bally > 128 then
        if lives > 0 then 
            sfx(3)
            bally= 24
            lives -=1
        end
    else if lives == 0 then
        ballydir = 0
        ballxdir = 0
        bally = 64
        sfx(5)
    end
end
end


