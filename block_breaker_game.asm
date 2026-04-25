.model small
.stack 100h

.data 
gmsg db "GAME OVER!$"
gmsg2 db "PRESS P TO PLAY AGAIN$"
gmsg3 db "PRESS ESC TO EXIT$"
gmsg4 db "YOUR SCORE IS : $"












tname db 12 dup(' ')
px dw 0
py dw 0
level1 db "~level_1$"
level2 db "~level_2$"
pmsg db "GAME PAUSED!$"
pmsg2 db "PRESS ENTER TO RESUME$"
m1 db "(= BRICK BREAKER GAME =)$"
m3  db "Your name here:$"
m2 db "{press enter to continue}$"
p db "GAME PAUSED,TAKE A BREAK :)$"
msg5 db "==========Welcome!!===========$"
msg2 db "===(N)====NEW GAME============$"
msg3 db "===(l)====SELECT LEVEL========$"
msg4 db "===(s)====SCORES==============$"
msg db "=========BRICK BREAKER GAME!===$"
msg6 db "===(I)===INSTRUCTIONS=========$"

imsg db "INSTRUCTIONS:$"
imsg2 db "~use arrow keys to move the bar$"
imsg3 db " left and right$"
imsg4 db "~use spacebar to pause and resume $"
imsg5 db "the game$"
imsg6 db "~try to brick break as many blocks$"
imsg7 db " as possible$"
imsg8 db "~Conquer all 3 levels to be champion$"
imsg9 db " of brickbreaker!$"
imsg10 db "PRESS ENTER TO START THE GAME$"


.code
main1 proc
mov ax,@data
mov ds,ax
mov ax,0

call clear
call curs




mov dx,offset m1
mov ah,09
int 21h

;shift cursor
mov ah,2
mov bh,0
mov dh,10;row
mov dl,12 ;col
int 10h
mov bl, 10000011b 

mov dx,offset m2
mov ah,09h
int 21h



;shift cursor
mov ah,2
mov bh,0
mov dh,17
mov dl,18
int 10h
mov bl, 10000011b 
mov dx,offset m3
mov ah,09
int 21h
check:
mov ah,1
int 21h
cmp al,13
je welc
jne check

;mov dx,offset tname
;mov ah,3fh
;int 21h


;mov ah,07
;int 21h
;cmp al,13  ;ascii for enter
;je welc
;jne exit


;--------------------
curs proc
mov ah,2
mov bh,0
mov dl,5
mov dh,8
int 10h
ret
curs endp
;-------------------
clear proc
mov ax,06
mov bh,07
mov cx,0
mov dx,184Fh
int 10h
ret 
clear endp
;-------------------
welc:
call welcome

welcome proc

mov ah,0
mov al,13h
int 10h

;-------------------------------------------------------

mov ah,6
mov al,0
mov bh,10001111b 

mov ch,0
mov cl,0
mov dh,30
mov dl,80
int 10h

;----------------------------

mov ah,0
mov al,3
int 10h

mov ah,06h
mov bh,07
mov cx,0000
mov dx,184Fh
int 10h
mov ah,00
mov al,04
int 10h
mov cx,100
mov dx,50
back:
mov ah,0ch
mov al,01
int 10h
inc cx
cmp cx,700
jnz back




;------------------------------

;shift cursor
mov ah,2
mov bh,0
mov dh,5
mov dl,8
int 10h


;print char
;mov ah,9
;mov al,'h'

mov bl,10000001b  
mov dx,offset msg
mov ah,09h
int 21h


;shift cursor
mov ah,2
mov bh,0
mov dh,7
mov dl,8
int 10h

mov bl, 10000011b  ;1110b
mov dx,offset msg2
mov ah,09h
int 21h




;shift cursor
mov ah,2
mov bh,0
mov dh,9
mov dl,8
int 10h

mov bl, 10000011b  ;1110b
mov dx,offset msg3
mov ah,09h
int 21h

;shift cursor
mov ah,2
mov bh,0
mov dh,11
mov dl,8
int 10h

mov bl, 10000011b  ;1110b
mov dx,offset msg4
mov ah,09h
int 21h



;shift cursor
mov ah,2
mov bh,0
mov dh,13
mov dl,8
int 10h

mov bl, 10000011b  ;1110b
mov dx,offset msg5
mov ah,09h
int 21h

;shift cursor
mov ah,2
mov bh,0
mov dh,13
mov dl,8
int 10h

mov bl, 10000011b  ;1110b
mov dx,offset msg6
mov ah,09h
int 21h

mov ah,07
int 21h
cmp al,105
je inst
jne exit1
;-------------------------------------------------------
;----------------------------------------------
inst:
call instructions

instructions proc

mov ah,0
mov al,13h
int 10h

;-------------------------------------------------------

mov ah,0
mov al,0
mov bh,10001111b 

mov ch,0
mov cl,0
mov dh,30
mov dl,80
int 10h

;shift cursor
mov ah,2
mov bh,0
mov dh,2
mov dl,3
int 10h


;print char
;mov ah,9
;mov al,'h'

mov bl,10000001b  
mov dx,offset imsg
mov ah,09h
int 21h

;shift cursor
mov ah,2
mov bh,0
mov dh,4
mov dl,0
int 10h

mov bl, 10000011b  ;1110b
mov dx,offset imsg2
mov ah,09h
int 21h


;shift cursor
mov ah,2
mov bh,0
mov dh,6
mov dl,0
int 10h

mov bl, 10000011b  ;1110b
mov dx,offset imsg3
mov ah,09h
int 21h

;shift cursor
mov ah,2
mov bh,0
mov dh,9
mov dl,0
int 10h

mov bl, 10000011b  ;1110b
mov dx,offset imsg4
mov ah,09h
int 21h



;shift cursor
mov ah,2
mov bh,0
mov dh,11
mov dl,0
int 10h

mov bl, 10000011b  ;1110b
mov dx,offset imsg5
mov ah,09h
int 21h

;shift cursor
mov ah,2
mov bh,0
mov dh,14
mov dl,0
int 10h

mov bl, 10000011b  ;1110b
mov dx,offset imsg6
mov ah,09h
int 21h


;shift cursor
mov ah,2
mov bh,0
mov dh,16
mov dl,0
int 10h

mov bl, 10000011b  ;1110b
mov dx,offset imsg7
mov ah,09h
int 21h


;shift cursor
mov ah,2
mov bh,0
mov dh,18
mov dl,0
int 10h

mov bl, 10000011b  ;1110b
mov dx,offset imsg8
mov ah,09h
int 21h


;shift cursor
mov ah,2
mov bh,0
mov dh,20
mov dl,0
int 10h

mov bl, 10000011b  ;1110b
mov dx,offset imsg9
mov ah,09h
int 21h


;shift cursor
mov ah,2
mov bh,0
mov dh,23
mov dl,0
int 10h

mov bl, 10000011b  ;1110b
mov dx,offset imsg10
mov ah,09h
int 21h

mov ah,07
int 21h
cmp al,13
je start
jne exit2

;-------------------------------------------------------
start:
call startgame
startgame proc
mov ah,07
int 21h
.if(al==27)

call gamepause

;///////////////////
gamepause proc

mov al, 0

wapis:

mov ah, 0
int 16h    ; if not input, zero flag is 1



cmp al, 27
jne wapis


ret
gamepause endp

;/////////////////////

.endif

.data
;these control the movement of the paddle

v1 db 10
v2 db 16
v3 db 9
v4 db 15

vv5 dw 80
vv6 dw 128





;these help create the outline of the game

x dw 0
y dw 0


;these will help create the dimensions of the ball

ball_x dw 100
ball_y dw 170
ball_size dw 04h


;to compare with the time present in dl to increment the x and y axis

time_aux db 0


;to decide the speed of the ball along x and y axis

ball_speed_x dw 4h   ; vel of ball in x axis
ball_speed_y dw 4h   ; vel of ball in y axis



ball_speed_l1_x dw 1
ball_speed_l1_y dw 1

ball_speed_l2_x dw 2
ball_speed_l2_y dw 2

ball_speed_l3_x dw 3
ball_speed_l3_y dw 3




;using this as a base to change the starting position of the ball back to what it was



ball_notoriginal_x dw 100
ball_notoriginal_y dw 170




;using this to save the shadow of the ball for the afterimage


ball_temp_x dw 100
ball_temp_y dw 170


;escaping the loop after the ball is popped

escape db 0





;making variables to store the coordinates for the black box to be, then level 2

b1 db 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0
b2 db 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 2, 2, 2, 2, 0
b3 db 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 0, 3, 3, 3, 3, 0



;columns of paddles, both left and right respectively(when moving left or right)









temppball_x dw 80
temppball_y dw 176








;to reprint the screen after the paddle touches the side of the screen or the ball does so

upp db 0
downn db 0
leftt db 0
rightt db 0







;lives

life dw 3


;switching levels
switch db 0

switch_temp db 0



;new level brooooo
mov dx,offset level2
mov ah,09h
int 21h

level dw 1





;score

score db 0




.code

mov ax, @data
mov ds, ax
mov ax,0

jmp main




box11 proc




mov ah, 6
mov al, 0
mov bh, 11     ;color
mov ch, 2     ;top row of window
mov cl, 3     ;left most column of window
mov dh, 4     ;Bottom row of window
mov dl, 7     ;Right most column of window
int 10h

ret
box11 endp


box12 proc





mov ah, 6
mov al, 0
mov bh, 11     ;color
mov ch, 2     ;top row of window
mov cl, 9     ;left most column of window
mov dh, 4     ;Bottom row of window
mov dl, 13     ;Right most column of window
int 10h


ret
box12 endp


box13 proc






mov ah, 6
mov al, 0
mov bh, 11     ;color
mov ch, 2     ;top row of window
mov cl, 15     ;left most column of window
mov dh, 4     ;Bottom row of window
mov dl, 19     ;Right most column of window
int 10h


ret
box13 endp


box14 proc






mov ah, 6
mov al, 0
mov bh, 11     ;color
mov ch, 2     ;top row of window
mov cl, 21     ;left most column of window
mov dh, 4     ;Bottom row of window
mov dl, 25     ;Right most column of window
int 10h


ret
box14 endp


box15 proc






mov ah, 6
mov al, 0
mov bh, 11     ;color
mov ch, 2     ;top row of window
mov cl, 27     ;left most column of window
mov dh, 4     ;Bottom row of window
mov dl, 31     ;Right most column of window
int 10h



ret
box15 endp


box16 proc






mov ah, 6
mov al, 0
mov bh, 11     ;color
mov ch, 2     ;top row of window
mov cl, 33     ;left most column of window
mov dh, 4     ;Bottom row of window
mov dl, 37     ;Right most column of window
int 10h



ret
box16 endp




;next line



box21 proc








mov ah, 6
mov al, 0
mov bh, 11     ;color
mov ch, 6     ;top row of window
mov cl, 3     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 7     ;Right most column of window
int 10h




ret
box21 endp


box22 proc







mov ah, 6
mov al, 0
mov bh, 11     ;color
mov ch, 6     ;top row of window
mov cl, 9     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 13     ;Right most column of window
int 10h




ret
box22 endp


box23 proc







mov ah, 6
mov al, 0
mov bh, 11     ;color
mov ch, 6     ;top row of window
mov cl, 15     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 19     ;Right most column of window
int 10h






ret
box23 endp


box24 proc








mov ah, 6
mov al, 0
mov bh, 11     ;color
mov ch, 6     ;top row of window
mov cl, 21     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 25     ;Right most column of window
int 10h





ret
box24 endp



box25 proc







mov ah, 6
mov al, 0
mov bh, 11     ;color
mov ch, 6     ;top row of window
mov cl, 27     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 31     ;Right most column of window
int 10h





ret
box25 endp


box26 proc








mov ah, 6
mov al, 0
mov bh, 11     ;color
mov ch, 6     ;top row of window
mov cl, 33     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 37     ;Right most column of window
int 10h





ret
box26 endp







;next line




;box31 proc





;mov ah, 6
;mov al, 0
;mov bh, 9     ;color
;mov ch, 10     ;top row of window
;mov cl, 3     ;left most column of window
;mov dh, 12     ;Bottom row of window
;mov dl, 7     ;Right most column of window
;int 10h





;ret
;box31 endp



box32 proc







mov ah, 6
mov al, 0
mov bh, 11     ;color
mov ch, 10     ;top row of window
mov cl, 9     ;left most column of window
mov dh, 12     ;Bottom row of window
mov dl, 13     ;Right most column of window
int 10h





ret
box32 endp



box33 proc







mov ah, 6
mov al, 0
mov bh, 11     ;color
mov ch, 10     ;top row of window
mov cl, 15     ;left most column of window
mov dh, 12     ;Bottom row of window
mov dl, 19     ;Right most column of window
int 10h





ret
box33 endp



box34 proc








mov ah, 6
mov al, 0
mov bh, 11     ;color
mov ch, 10     ;top row of window
mov cl, 21     ;left most column of window
mov dh, 12     ;Bottom row of window
mov dl, 25     ;Right most column of window
int 10h





ret
box34 endp



box35 proc








mov ah, 6
mov al, 0
mov bh, 11     ;color
mov ch, 10     ;top row of window
mov cl, 27     ;left most column of window
mov dh, 12     ;Bottom row of window
mov dl, 31     ;Right most column of window
int 10h





ret
box35 endp



;box36 proc








;mov ah, 6
;mov al, 0
;mov bh, 9     ;color
;mov ch, 10     ;top row of window
;mov cl, 33     ;left most column of window
;mov dh, 12     ;Bottom row of window
;mov dl, 37     ;Right most column of window
;int 10h





;ret
;box36 endp









box111 proc




mov ah, 6
mov al, 0
mov bh, 9     ;color
mov ch, 2     ;top row of window
mov cl, 3     ;left most column of window
mov dh, 4     ;Bottom row of window
mov dl, 7     ;Right most column of window
int 10h

ret
box111 endp


box121 proc





mov ah, 6
mov al, 0
mov bh, 9     ;color
mov ch, 2     ;top row of window
mov cl, 9     ;left most column of window
mov dh, 4     ;Bottom row of window
mov dl, 13     ;Right most column of window
int 10h


ret
box121 endp


box131 proc






mov ah, 6
mov al, 0
mov bh, 9     ;color
mov ch, 2     ;top row of window
mov cl, 15     ;left most column of window
mov dh, 4     ;Bottom row of window
mov dl, 19     ;Right most column of window
int 10h


ret
box131 endp


box141 proc






mov ah, 6
mov al, 0
mov bh, 9     ;color
mov ch, 2     ;top row of window
mov cl, 21     ;left most column of window
mov dh, 4     ;Bottom row of window
mov dl, 25     ;Right most column of window
int 10h


ret
box141 endp


box151 proc






mov ah, 6
mov al, 0
mov bh, 9     ;color
mov ch, 2     ;top row of window
mov cl, 27     ;left most column of window
mov dh, 4     ;Bottom row of window
mov dl, 31     ;Right most column of window
int 10h



ret
box151 endp


box161 proc






mov ah, 6
mov al, 0
mov bh, 9     ;color
mov ch, 2     ;top row of window
mov cl, 33     ;left most column of window
mov dh, 4     ;Bottom row of window
mov dl, 37     ;Right most column of window
int 10h



ret
box161 endp




;next line



box211 proc








mov ah, 6
mov al, 0
mov bh, 9     ;color
mov ch, 6     ;top row of window
mov cl, 3     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 7     ;Right most column of window
int 10h




ret
box211 endp


box221 proc







mov ah, 6
mov al, 0
mov bh, 9     ;color
mov ch, 6     ;top row of window
mov cl, 9     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 13     ;Right most column of window
int 10h




ret
box221 endp


box231 proc







mov ah, 6
mov al, 0
mov bh, 9     ;color
mov ch, 6     ;top row of window
mov cl, 15     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 19     ;Right most column of window
int 10h






ret
box231 endp


box241 proc








mov ah, 6
mov al, 0
mov bh, 9     ;color
mov ch, 6     ;top row of window
mov cl, 21     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 25     ;Right most column of window
int 10h





ret
box241 endp



box251 proc







mov ah, 6
mov al, 0
mov bh, 9     ;color
mov ch, 6     ;top row of window
mov cl, 27     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 31     ;Right most column of window
int 10h





ret
box251 endp


box261 proc








mov ah, 6
mov al, 0
mov bh, 9     ;color
mov ch, 6     ;top row of window
mov cl, 33     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 37     ;Right most column of window
int 10h





ret
box261 endp







;next line




;box31 proc





;mov ah, 6
;mov al, 0
;mov bh, 9     ;color
;mov ch, 10     ;top row of window
;mov cl, 3     ;left most column of window
;mov dh, 12     ;Bottom row of window
;mov dl, 7     ;Right most column of window
;int 10h





;ret
;box31 endp



box321 proc







mov ah, 6
mov al, 0
mov bh, 9     ;color
mov ch, 10     ;top row of window
mov cl, 9     ;left most column of window
mov dh, 12     ;Bottom row of window
mov dl, 13     ;Right most column of window
int 10h





ret
box321 endp



box331 proc







mov ah, 6
mov al, 0
mov bh, 9     ;color
mov ch, 10     ;top row of window
mov cl, 15     ;left most column of window
mov dh, 12     ;Bottom row of window
mov dl, 19     ;Right most column of window
int 10h





ret
box331 endp



box341 proc








mov ah, 6
mov al, 0
mov bh, 9     ;color
mov ch, 10     ;top row of window
mov cl, 21     ;left most column of window
mov dh, 12     ;Bottom row of window
mov dl, 25     ;Right most column of window
int 10h





ret
box341 endp



box351 proc








mov ah, 6
mov al, 0
mov bh, 9     ;color
mov ch, 10     ;top row of window
mov cl, 27     ;left most column of window
mov dh, 12     ;Bottom row of window
mov dl, 31     ;Right most column of window
int 10h





ret
box351 endp





















box1111 proc




mov ah, 6
mov al, 0
mov bh, 1     ;color
mov ch, 2     ;top row of window
mov cl, 3     ;left most column of window
mov dh, 4     ;Bottom row of window
mov dl, 7     ;Right most column of window
int 10h

ret
box1111 endp


box1211 proc





mov ah, 6
mov al, 0
mov bh, 1     ;color
mov ch, 2     ;top row of window
mov cl, 9     ;left most column of window
mov dh, 4     ;Bottom row of window
mov dl, 13     ;Right most column of window
int 10h


ret
box1211 endp


box1311 proc






mov ah, 6
mov al, 0
mov bh, 1     ;color
mov ch, 2     ;top row of window
mov cl, 15     ;left most column of window
mov dh, 4     ;Bottom row of window
mov dl, 19     ;Right most column of window
int 10h


ret
box1311 endp


box1411 proc






mov ah, 6
mov al, 0
mov bh, 1     ;color
mov ch, 2     ;top row of window
mov cl, 21     ;left most column of window
mov dh, 4     ;Bottom row of window
mov dl, 25     ;Right most column of window
int 10h


ret
box1411 endp


box1511 proc






mov ah, 6
mov al, 0
mov bh, 1     ;color
mov ch, 2     ;top row of window
mov cl, 27     ;left most column of window
mov dh, 4     ;Bottom row of window
mov dl, 31     ;Right most column of window
int 10h



ret
box1511 endp


box1611 proc






mov ah, 6
mov al, 0
mov bh, 1     ;color
mov ch, 2     ;top row of window
mov cl, 33     ;left most column of window
mov dh, 4     ;Bottom row of window
mov dl, 37     ;Right most column of window
int 10h



ret
box1611 endp




;next line



box2111 proc








mov ah, 6
mov al, 0
mov bh, 1     ;color
mov ch, 6     ;top row of window
mov cl, 3     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 7     ;Right most column of window
int 10h




ret
box2111 endp


box2211 proc







mov ah, 6
mov al, 0
mov bh, 1     ;color
mov ch, 6     ;top row of window
mov cl, 9     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 13     ;Right most column of window
int 10h




ret
box2211 endp


box2311 proc







mov ah, 6
mov al, 0
mov bh, 1     ;color
mov ch, 6     ;top row of window
mov cl, 15     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 19     ;Right most column of window
int 10h






ret
box2311 endp


box2411 proc








mov ah, 6
mov al, 0
mov bh, 1     ;color
mov ch, 6     ;top row of window
mov cl, 21     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 25     ;Right most column of window
int 10h





ret
box2411 endp



box2511 proc







mov ah, 6
mov al, 0
mov bh, 1     ;color
mov ch, 6     ;top row of window
mov cl, 27     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 31     ;Right most column of window
int 10h





ret
box2511 endp


box2611 proc








mov ah, 6
mov al, 0
mov bh, 1     ;color
mov ch, 6     ;top row of window
mov cl, 33     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 37     ;Right most column of window
int 10h





ret
box2611 endp







;next line




;box31 proc





;mov ah, 6
;mov al, 0
;mov bh, 9     ;color
;mov ch, 10     ;top row of window
;mov cl, 3     ;left most column of window
;mov dh, 12     ;Bottom row of window
;mov dl, 7     ;Right most column of window
;int 10h





;ret
;box31 endp



box3211 proc







mov ah, 6
mov al, 0
mov bh, 1     ;color
mov ch, 10     ;top row of window
mov cl, 9     ;left most column of window
mov dh, 12     ;Bottom row of window
mov dl, 13     ;Right most column of window
int 10h





ret
box3211 endp



box3311 proc







mov ah, 6
mov al, 0
mov bh, 1     ;color
mov ch, 10     ;top row of window
mov cl, 15     ;left most column of window
mov dh, 12     ;Bottom row of window
mov dl, 19     ;Right most column of window
int 10h





ret
box3311 endp



box3411 proc








mov ah, 6
mov al, 0
mov bh, 1     ;color
mov ch, 10     ;top row of window
mov cl, 21     ;left most column of window
mov dh, 12     ;Bottom row of window
mov dl, 25     ;Right most column of window
int 10h





ret
box3411 endp



box3511 proc








mov ah, 6
mov al, 0
mov bh, 1     ;color
mov ch, 10     ;top row of window
mov cl, 27     ;left most column of window
mov dh, 12     ;Bottom row of window
mov dl, 31     ;Right most column of window
int 10h





ret
box3511 endp













































leftie proc





sub v1, 1
sub v2, 1










mov ah, 6
mov al, 0
mov bh, 4     ;color
mov ch, 22     ;top row of window
mov cl, v1     ;left most column of window
mov dh, 23     ;Bottom row of window
mov dl, v1     ;Right most column of window
int 10h

mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 22     ;top row of window
mov cl, v2     ;left most column of window
mov dh, 23     ;Bottom row of window
mov dl, v2     ;Right most column of window
int 10h






















ret
leftie endp


rightie proc


add v3, 1
add v4, 1






mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 22     ;top row of window
mov cl, v3     ;left most column of window
mov dh, 23     ;Bottom row of window
mov dl, v3     ;Right most column of window
int 10h

mov ah, 6
mov al, 0
mov bh, 4     ;color
mov ch, 22     ;top row of window
mov cl, v4     ;left most column of window
mov dh, 23     ;Bottom row of window
mov dl, v4     ;Right most column of window
int 10h



















ret
rightie endp


























create_ball proc 


MOV CX, ball_x    ;x-cordinate (column)
MOV DX, ball_y   ;y-cordinate (row)




mov ax, ball_x
mov ball_temp_x, ax

mov ax, ball_y
mov ball_temp_y, ax







ball_horizontal:

MOV AL, 1110b  ;yellow color
MOV AH, 0CH 
INT 10H

inc cx


mov ax, cx
sub ax, ball_x
cmp ax, ball_size
jng ball_horizontal



mov cx, ball_x
inc dx
mov ax, dx
sub ax, ball_y
cmp ax, ball_size
jng ball_horizontal








ret 
create_ball endp








shadow_ball proc





MOV CX, ball_temp_x    ;x-cordinate (column)
MOV DX, ball_temp_y   ;y-cordinate (row)

ball_horizontal2:

MOV AL, 0  ;black color
MOV AH, 0CH 
INT 10H

inc cx


mov ax, cx
sub ax, ball_temp_x
cmp ax, ball_size
jng ball_horizontal2



mov cx, ball_temp_x
inc dx
mov ax, dx
sub ax, ball_temp_y
cmp ax, ball_size
jng ball_horizontal2


























;mov ah,00h
;mov al,13h
;int 10h




;mov ah, 0bh
;mov bh, 00h
;mov bl, 00h
;int 10h






ret
shadow_ball endp






















ball_speed_ftn proc




;THIS IS WHERE I ALTER THE STARTING DIRECTION OF X AXIS










mov ax, ball_speed_x
;add ball_x, ax

add ball_x, ax













cmp ball_x, 01h
jl neg_speed_x


cmp ball_x,313
jg neg_speed_x



;cmp ball_x, 300
;jg neg_speed_x


;THIS IS WHERE I ALTER THE STARTING DIRECTION OF Y AXIS


mov ax, ball_speed_y
;add ball_y, ax
sub ball_y, ax













.if(level==1)

call testing

.endif


.if(level==2)

call testing2

.endif


.if(level==3)

call testing3

.endif




call paddlebounce







cmp ball_y, 01h
jl neg_speed_y


cmp ball_y,194
jg restarting_ball

;cmp ball_y, 50
;jg neg_speed_y


ret

neg_speed_x:

neg ball_speed_x
ret

neg_speed_y:

neg ball_speed_y
ret




restarting_ball:

call reset_ball_pos



neg ball_speed_y

neg ball_speed_x


mov escape, 1




ret








ball_speed_ftn endp

















reset_ball_pos proc






mov ax, ball_notoriginal_x
mov ball_x, ax


mov ax, ball_notoriginal_y
mov ball_y, ax











ret
reset_ball_pos endp



paddlebounce proc



















;mov ax, 0
;mov bx, 0

;mov al, vv5     ;  ax = 5
;mov bl, v1     ;  bx = 10
;mov dx, 16

;mul dx

;mov bx, ax  ;bx = 80


;add ax, 48









;mul dx        ;ax = 256
;mov bx, ax ; bx mein v2 hai,   v2=176

;mov ax, 0
;mov al, v1   ; ax = 10



;mov dx,0
;mov dx, 8
;mul dx       ; ax = 160


mov ax, vv5
mov bx, vv6










;.if (ball_y<200&&ball>150)
.if(ball_y<174&&ball_y>170)

.if(ball_x>ax&&ball_x<bx )




neg ball_speed_y


.endif
.endif





ret
paddlebounce endp



















testing proc




.if(b1[0]==0)
jmp LL1
.endif

call checkbox11

LL1:

.if(b1[1]==0)
jmp LL2
.endif

call checkbox12

LL2:

.if(b1[2]==0)
jmp LL3
.endif

call checkbox13

LL3:

.if(b1[3]==0)
jmp LL4
.endif

call checkbox14

LL4:

.if(b1[4]==0)
jmp LL5
.endif

call checkbox15

LL5:

.if(b1[5]==0)
jmp LL6
.endif

call checkbox16

LL6:

.if(b1[6]==0)
jmp LL7
.endif

call checkbox21

LL7:

.if(b1[7]==0)
jmp LL8
.endif

call checkbox22

LL8:

.if(b1[8]==0)
jmp LL9
.endif

call checkbox23

LL9:


.if(b1[9]==0)
jmp LL10
.endif

call checkbox24

LL10:

.if(b1[10]==0)
jmp LL11
.endif

call checkbox25

LL11:

.if(b1[11]==0)
jmp LL12
.endif

call checkbox26

LL12:


;.if(b1[12]==0)
;jmp LL13
;.endif

;call checkbox31

;LL13:

.if(b1[13]==0)
jmp LL14
.endif

call checkbox32

LL14:

.if(b1[14]==0)
jmp LL15
.endif

call checkbox33

LL15:

.if(b1[15]==0)
jmp LL16
.endif

call checkbox34

LL16:


.if(b1[16]==0)
jmp LL17
.endif

call checkbox35

LL17:

;.if(b1[17]==0)
;jmp LL18
;.endif

;call checkbox36

;LL18:






ret 
testing endp









testing2 proc



.if(b2[0]==1)

call checkbox11
.endif

.if(b2[0]==2)

call checkbox111

.endif



.if(b2[1]==1)

call checkbox12
.endif

.if(b2[1]==2)

call checkbox121

.endif



.if(b2[2]==1)

call checkbox13
.endif




.if(b2[2]==2)

call checkbox131

.endif



.if(b2[3]==1)

call checkbox14
.endif


.if(b2[3]==2)

call checkbox141

.endif



.if(b2[4]==1)

call checkbox15
.endif




.if(b2[4]==2)

call checkbox151

.endif



.if(b2[5]==1)

call checkbox16
.endif


.if(b2[5]==2)

call checkbox161

.endif




.if(b2[6]==1)

call checkbox21
.endif



.if(b2[6]==2)

call checkbox211

.endif




.if(b2[7]==1)

call checkbox22
.endif




.if(b2[7]==2)

call checkbox221

.endif



.if(b2[8]==1)

call checkbox23
.endif



.if(b2[8]==2)

call checkbox231

.endif



.if(b2[9]==1)

call checkbox24
.endif




.if(b2[9]==2)

call checkbox241

.endif




.if(b2[10]==1)

call checkbox25
.endif



.if(b2[10]==2)

call checkbox251

.endif




.if(b2[11]==1)

call checkbox26
.endif




.if(b2[11]==2)

call checkbox261

.endif




.if(b2[13]==1)

call checkbox32
.endif




.if(b2[13]==2)

call checkbox321

.endif


.if(b2[14]==1)

call checkbox33
.endif





.if(b2[14]==2)

call checkbox331

.endif



.if(b2[15]==1)

call checkbox34
.endif




.if(b2[15]==2)

call checkbox341

.endif





.if(b2[16]==1)

call checkbox35
.endif





.if(b2[16]==2)

call checkbox351

.endif



















ret 
testing2 endp

















testing3 proc



.if(b3[0]==1)

call checkbox11
.endif

.if(b3[0]==2)

call checkbox111

.endif


.if(b3[0]==3)

call checkbox1111

.endif





.if(b3[1]==1)

call checkbox12
.endif

.if(b3[1]==2)

call checkbox121

.endif


.if(b3[1]==3)

call checkbox1211

.endif



.if(b3[2]==1)

call checkbox13
.endif




.if(b3[2]==2)

call checkbox131

.endif

.if(b3[2]==3)

call checkbox1311

.endif




.if(b3[3]==1)

call checkbox14
.endif


.if(b3[3]==2)

call checkbox141

.endif

.if(b3[3]==3)

call checkbox1411

.endif




.if(b3[4]==1)

call checkbox15
.endif




.if(b3[4]==2)

call checkbox151

.endif

.if(b3[4]==3)

call checkbox1511

.endif




.if(b3[5]==1)

call checkbox16
.endif


.if(b3[5]==2)

call checkbox161

.endif

.if(b3[5]==3)

call checkbox1611

.endif





.if(b3[6]==1)

call checkbox21
.endif



.if(b3[6]==2)

call checkbox211

.endif

.if(b3[6]==3)

call checkbox2111

.endif





.if(b3[7]==1)

call checkbox22
.endif




.if(b3[7]==2)

call checkbox221

.endif

.if(b3[7]==3)

call checkbox2211

.endif


.if(b3[8]==1)

call checkbox23
.endif



.if(b3[8]==2)

call checkbox231

.endif

.if(b3[8]==3)

call checkbox2311

.endif



.if(b3[9]==1)

call checkbox24
.endif




.if(b3[9]==2)

call checkbox241

.endif


.if(b3[9]==3)

call checkbox2411

.endif





.if(b3[10]==1)

call checkbox25
.endif



.if(b3[10]==2)

call checkbox251

.endif


.if(b3[10]==3)

call checkbox2511

.endif





.if(b3[11]==1)

call checkbox26
.endif




.if(b3[11]==2)

call checkbox261

.endif


.if(b3[11]==3)

call checkbox2611

.endif





.if(b3[13]==1)

call checkbox32
.endif




.if(b3[13]==2)

call checkbox321

.endif


.if(b3[13]==3)

call checkbox3211

.endif



.if(b3[14]==1)

call checkbox33
.endif





.if(b3[14]==2)

call checkbox331

.endif

.if(b3[14]==3)

call checkbox3311

.endif


.if(b3[15]==1)

call checkbox34
.endif




.if(b3[15]==2)

call checkbox341

.endif


.if(b3[15]==3)

call checkbox3411

.endif



.if(b3[16]==1)

call checkbox35
.endif





.if(b3[16]==2)

call checkbox351

.endif

.if(b3[16]==3)

call checkbox3511

.endif


















ret 
testing3 endp
























































checkbox11 proc



.if (ball_x>21 && ball_x<67)

.if (ball_y<43&&ball_y>13)


neg ball_speed_y

mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 2     ;top row of window
mov cl, 3     ;left most column of window
mov dh, 4     ;Bottom row of window
mov dl, 7     ;Right most column of window
int 10h



sub b1[0], 1

add score, 1



.if (level==2)
sub b2[0], 1

add score, 1

.endif


.if (level==3)
sub b3[0], 1
add score, 1

.endif



ret

.endif
.endif


.if (ball_y<43&&ball_y>13)

.if (ball_x>21 && ball_x<67)



neg ball_speed_x

mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 2     ;top row of window
mov cl, 3     ;left most column of window
mov dh, 4     ;Bottom row of window
mov dl, 7     ;Right most column of window
int 10h


sub b1[0], 1
add score, 1


.if (level==2)
sub b2[0], 1
add score, 1
.endif



.if (level==3)
sub b3[0], 1
add score, 1
.endif





.endif
.endif








ret
checkbox11 endp




checkbox12 proc



.if (ball_x>69 && ball_x<115)

.if (ball_y<43&&ball_y>13)


neg ball_speed_y


mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 2     ;top row of window
mov cl, 9     ;left most column of window
mov dh, 4     ;Bottom row of window
mov dl, 13     ;Right most column of window
int 10h



sub b1[1], 1

add score, 1

.if (level==2)
sub b2[1], 1
add score, 1
.endif




.if (level==3)
sub b3[1], 1
add score, 1
.endif




ret


.endif
.endif


.if (ball_y<43&&ball_y>13)

.if (ball_x>69 && ball_x<115)



neg ball_speed_x


mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 2     ;top row of window
mov cl, 9     ;left most column of window
mov dh, 4     ;Bottom row of window
mov dl, 13     ;Right most column of window
int 10h



sub b1[1], 1
add score, 1


.if (level==2)
sub b2[1], 1
add score, 1
.endif



.if (level==3)
sub b3[1], 1
add score, 1
.endif





.endif
.endif












ret
checkbox12 endp




checkbox13 proc



.if (ball_x>117 && ball_x<163)

.if (ball_y<43&&ball_y>13)


neg ball_speed_y


mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 2     ;top row of window
mov cl, 15     ;left most column of window
mov dh, 4     ;Bottom row of window
mov dl, 19     ;Right most column of window
int 10h



sub b1[2], 1
add score, 1


.if (level==2)
sub b2[2], 1
add score, 1
.endif



.if (level==3)
sub b3[2], 1
add score, 1
.endif



ret


.endif
.endif



.if (ball_y<43&&ball_y>13)

.if (ball_x>117 && ball_x<163)



neg ball_speed_x


mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 2     ;top row of window
mov cl, 15     ;left most column of window
mov dh, 4     ;Bottom row of window
mov dl, 19     ;Right most column of window
int 10h



sub b1[2], 1
add score, 1


.if (level==2)
sub b2[2], 1
add score, 1
.endif




.if (level==3)
sub b3[2], 1
add score, 1
.endif




.endif
.endif





ret
checkbox13 endp


checkbox14 proc



.if (ball_x>165 && ball_x<211)

.if (ball_y<43&&ball_y>13)


neg ball_speed_x


mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 2     ;top row of window
mov cl, 21     ;left most column of window
mov dh, 4     ;Bottom row of window
mov dl, 25     ;Right most column of window
int 10h



sub b1[3], 1
add score, 1


.if (level==2)
sub b2[3], 1
add score, 1
.endif



.if (level==3)
sub b3[3], 1
add score, 1
.endif



ret


.endif
.endif


.if (ball_y<43&&ball_y>13)

.if (ball_x>165 && ball_x<211)



neg ball_speed_y


mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 2     ;top row of window
mov cl, 21     ;left most column of window
mov dh, 4     ;Bottom row of window
mov dl, 25     ;Right most column of window
int 10h



sub b1[3], 1
add score, 1


.if (level==2)
sub b2[3], 1
add score, 1
.endif



.if (level==3)
sub b3[3], 1
add score, 1
.endif





.endif
.endif





ret
checkbox14 endp










checkbox15 proc



.if (ball_x>213 && ball_x<259)

.if (ball_y<43&&ball_y>13)


neg ball_speed_y

mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 2     ;top row of window
mov cl, 27     ;left most column of window
mov dh, 4     ;Bottom row of window
mov dl, 31     ;Right most column of window
int 10h



sub b1[4], 1
add score, 1


.if (level==2)
sub b2[4], 1
add score, 1
.endif



.if (level==3)
sub b3[4], 1
add score, 1
.endif



ret


.endif
.endif


.if (ball_y<43&&ball_y>13)

.if (ball_x>213 && ball_x<259)



neg ball_speed_x

mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 2     ;top row of window
mov cl, 27     ;left most column of window
mov dh, 4     ;Bottom row of window
mov dl, 31     ;Right most column of window
int 10h



sub b1[4], 1
add score, 1


.if (level==2)
sub b2[4], 1
add score, 1
.endif



.if (level==3)
sub b3[4], 1
add score, 1
.endif





.endif
.endif









ret
checkbox15 endp



checkbox16 proc



.if (ball_x>261 && ball_x<307)

.if (ball_y<43&&ball_y>13)


neg ball_speed_y


mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 2     ;top row of window
mov cl, 33     ;left most column of window
mov dh, 4     ;Bottom row of window
mov dl, 37     ;Right most column of window
int 10h



sub b1[5], 1
add score, 1


.if (level==2)
sub b2[5], 1
add score, 1
.endif



.if (level==3)
sub b3[5], 1
add score, 1
.endif



ret


.endif
.endif


.if (ball_y<43&&ball_y>13)

.if (ball_x>261 && ball_x<307)



neg ball_speed_x


mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 2     ;top row of window
mov cl, 33     ;left most column of window
mov dh, 4     ;Bottom row of window
mov dl, 37     ;Right most column of window
int 10h



sub b1[5], 1
add score, 1


.if (level==2)
sub b2[5], 1
add score, 1
.endif



.if (level==3)
sub b3[5], 1
add score, 1
.endif





.endif
.endif






ret
checkbox16 endp








;next line

checkbox21 proc



.if (ball_x>21 && ball_x<67)

.if (ball_y<75&&ball_y>45)


neg ball_speed_y


mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 6     ;top row of window
mov cl, 3     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 7     ;Right most column of window
int 10h



sub b1[6], 1
add score, 1


.if (level==2)
sub b2[6], 1
add score, 1
.endif



.if (level==3)
sub b3[6], 1
add score, 1
.endif



ret

.endif
.endif


.if (ball_y<75&&ball_y>45)

.if (ball_x>21 && ball_x<67)



neg ball_speed_x


mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 6     ;top row of window
mov cl, 3     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 7     ;Right most column of window
int 10h



sub b1[6], 1
add score, 1


.if (level==2)
sub b2[6], 1
add score, 1
.endif



.if (level==3)
sub b3[6], 1
add score, 1
.endif





.endif
.endif





ret
checkbox21 endp


checkbox22 proc



.if (ball_x>69 && ball_x<115)

.if (ball_y<75&&ball_y>45)


neg ball_speed_y


mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 6     ;top row of window
mov cl, 9     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 13     ;Right most column of window
int 10h



sub b1[7], 1
add score, 1


.if (level==2)
sub b2[7], 1
add score, 1
.endif



.if (level==3)
sub b3[7], 1
add score, 1
.endif




ret

.endif
.endif


.if (ball_y<75&&ball_y>45)

.if (ball_x>69 && ball_x<115)



neg ball_speed_x


mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 6     ;top row of window
mov cl, 9     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 13     ;Right most column of window
int 10h



sub b1[7], 1
add score, 1


.if (level==2)
sub b2[7], 1
add score, 1
.endif




.if (level==3)
sub b3[7], 1
add score, 1
.endif




.endif
.endif




ret
checkbox22 endp


checkbox23 proc



.if (ball_x>117 && ball_x<163)

.if (ball_y<75&&ball_y>45)


neg ball_speed_y


mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 6     ;top row of window
mov cl, 15     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 19     ;Right most column of window
int 10h



sub b1[8], 1
add score, 1


.if (level==2)
sub b2[8], 1
add score, 1
.endif



.if (level==3)
sub b3[8], 1
add score, 1
.endif



ret


.endif
.endif


.if (ball_y<75&&ball_y>45)

.if (ball_x>117 && ball_x<163)



neg ball_speed_x


mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 6     ;top row of window
mov cl, 15     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 19     ;Right most column of window
int 10h



sub b1[8], 1
add score, 1


.if (level==2)
sub b2[8], 1
add score, 1
.endif



.if (level==3)
sub b3[8], 1
add score, 1
.endif





.endif
.endif




ret
checkbox23 endp


checkbox24 proc



.if (ball_x>165 && ball_x<211)

.if (ball_y<75&&ball_y>45)


neg ball_speed_y


mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 6     ;top row of window
mov cl, 21     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 25     ;Right most column of window
int 10h



sub b1[9], 1
add score, 1


.if (level==2)
sub b2[9], 1
add score, 1
.endif



.if (level==3)
sub b3[9], 1
add score, 1
.endif



ret


.endif
.endif


.if (ball_y<75&&ball_y>45)

.if (ball_x>165 && ball_x<211)



neg ball_speed_x


mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 6     ;top row of window
mov cl, 21     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 25     ;Right most column of window
int 10h



sub b1[9], 1
add score, 1


.if (level==2)
sub b2[9], 1
add score, 1
.endif




.if (level==3)
sub b3[9], 1
add score, 1
.endif




.endif
.endif





ret
checkbox24 endp


checkbox25 proc



.if (ball_x>213 && ball_x<259)

.if (ball_y<75&&ball_y>45)


neg ball_speed_y


mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 6     ;top row of window
mov cl, 27     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 31     ;Right most column of window
int 10h



sub b1[10], 1
add score, 1


.if (level==2)
sub b2[10], 1
add score, 1
.endif



.if (level==3)
sub b3[10], 1
add score, 1
.endif



ret


.endif
.endif

.if (ball_y<75&&ball_y>45)

.if (ball_x>213 && ball_x<259)



neg ball_speed_x


mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 6     ;top row of window
mov cl, 27     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 31     ;Right most column of window
int 10h



sub b1[10], 1
add score, 1


.if (level==2)
sub b2[10], 1
add score, 1
.endif



.if (level==3)
sub b3[10], 1
add score, 1
.endif





.endif
.endif






ret
checkbox25 endp



checkbox26 proc



.if (ball_x>261 && ball_x<307)

.if (ball_y<75&&ball_y>45)


neg ball_speed_y


mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 6     ;top row of window
mov cl, 33     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 37     ;Right most column of window
int 10h



sub b1[11], 1
add score, 1


.if (level==2)
sub b2[11], 1
add score, 1
.endif



.if (level==3)
sub b3[11], 1
add score, 1
.endif



ret


.endif
.endif



.if (ball_y<75&&ball_y>45)

.if (ball_x>261 && ball_x<307)



neg ball_speed_x


mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 6     ;top row of window
mov cl, 33     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 37     ;Right most column of window
int 10h



sub b1[11], 1
add score, 1


.if (level==2)
sub b2[11], 1
add score, 1
.endif



.if (level==3)
sub b3[11], 1
add score, 1
.endif





.endif
.endif







ret
checkbox26 endp









;next line

;checkbox31 proc



;.if (ball_x>21 && ball_x<67)

;.if (ball_y<110&&ball_y>77)


;neg ball_speed_x


;mov ah, 6
;mov al, 0
;mov bh, 0     ;color
;mov ch, 10     ;top row of window
;mov cl, 3     ;left most column of window
;mov dh, 12     ;Bottom row of window
;mov dl, 7     ;Right most column of window
;int 10h



;sub b1[12], 1


;ret


;.endif
;.endif



;.if (ball_y<107&&ball_y>77)

;.if (ball_x>21 && ball_x<67)



;neg ball_speed_y


;mov ah, 6
;mov al, 0
;mov bh, 0     ;color
;mov ch, 10     ;top row of window
;mov cl, 3     ;left most column of window
;mov dh, 12     ;Bottom row of window
;mov dl, 7     ;Right most column of window
;int 10h



;sub b1[12], 1




;.endif
;.endif








;ret
;checkbox31 endp


checkbox32 proc



.if (ball_x>69 && ball_x<115)

.if (ball_y<107&&ball_y>77)


neg ball_speed_x


mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 10     ;top row of window
mov cl, 9     ;left most column of window
mov dh, 12     ;Bottom row of window
mov dl, 13     ;Right most column of window
int 10h



sub b1[13], 1
add score, 1


.if (level==2)
sub b2[13], 1
add score, 1
.endif



.if (level==3)
sub b3[13], 1
add score, 1
.endif




ret


.endif
.endif


.if (ball_y<107&&ball_y>77)

.if (ball_x>69 && ball_x<115)



neg ball_speed_y


mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 10     ;top row of window
mov cl, 9     ;left most column of window
mov dh, 12     ;Bottom row of window
mov dl, 13     ;Right most column of window
int 10h



sub b1[13], 1
add score, 1


.if (level==2)
sub b2[13], 1
add score, 1
.endif



.if (level==3)
sub b3[13], 1
add score, 1
.endif





.endif
.endif







ret
checkbox32 endp

checkbox33 proc



.if (ball_x>117 && ball_x<163)

.if (ball_y<107&&ball_y>77)


neg ball_speed_y


mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 10     ;top row of window
mov cl, 15     ;left most column of window
mov dh, 12     ;Bottom row of window
mov dl, 19     ;Right most column of window
int 10h



sub b1[14], 1
add score, 1


.if (level==2)
sub b2[14], 1
add score, 1
.endif



.if (level==3)
sub b3[14], 1
add score, 1
.endif




ret


.endif
.endif

.if (ball_y<107&&ball_y>77)

.if (ball_x>117 && ball_x<163)



neg ball_speed_x


mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 10     ;top row of window
mov cl, 15     ;left most column of window
mov dh, 12     ;Bottom row of window
mov dl, 19     ;Right most column of window
int 10h



sub b1[14], 1
add score, 1


.if (level==2)
sub b2[14], 1
add score, 1
.endif



.if (level==3)
sub b3[14], 1
add score, 1
.endif





.endif
.endif




ret
checkbox33 endp


checkbox34 proc



.if (ball_x>165 && ball_x<211)

.if (ball_y<107&&ball_y>77)


neg ball_speed_y


mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 10     ;top row of window
mov cl, 21     ;left most column of window
mov dh, 12     ;Bottom row of window
mov dl, 25     ;Right most column of window
int 10h



sub b1[15], 1
add score, 1


.if (level==2)
sub b2[15], 1
add score, 1
.endif



.if (level==3)
sub b3[15], 1
add score, 1
.endif



ret


.endif
.endif


.if (ball_y<107&&ball_y>77)

.if (ball_x>165 && ball_x<211)



neg ball_speed_x


mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 10     ;top row of window
mov cl, 21     ;left most column of window
mov dh, 12     ;Bottom row of window
mov dl, 25     ;Right most column of window
int 10h



sub b1[15], 1
add score, 1


.if (level==2)
sub b2[15], 1
add score, 1
.endif



.if (level==3)
sub b3[15], 1
add score, 1
.endif





.endif
.endif




ret
checkbox34 endp


checkbox35 proc



.if (ball_x>216 && ball_x<256)

.if (ball_y<104&&ball_y>80)


neg ball_speed_y


mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 10     ;top row of window
mov cl, 27     ;left most column of window
mov dh, 12     ;Bottom row of window
mov dl, 31     ;Right most column of window
int 10h



sub b1[16], 1
add score, 1


.if (level==2)
sub b2[16], 1
add score, 1
.endif



.if (level==3)
sub b3[16], 1
add score, 1
.endif




ret

.endif
.endif




.if (ball_y<107&&ball_y>77)

.if (ball_x>213 && ball_x<257)


neg ball_speed_x


mov ah, 6
mov al, 0
mov bh, 0     ;color
mov ch, 10     ;top row of window
mov cl, 27     ;left most column of window
mov dh, 12     ;Bottom row of window
mov dl, 31     ;Right most column of window
int 10h



sub b1[16], 1
add score, 1


.if (level==2)
sub b2[16], 1
add score, 1
.endif



.if (level==3)
sub b3[16], 1
add score, 1
.endif





.endif
.endif




ret
checkbox35 endp


;checkbox36 proc



;.if (ball_x>261 && ball_x<307)

;.if (ball_y<104&&ball_y>80)


;neg ball_speed_x


;mov ah, 6
;mov al, 0
;mov bh, 0     ;color
;mov ch, 10     ;top row of window
;mov cl, 33     ;left most column of window
;mov dh, 12     ;Bottom row of window
;mov dl, 37     ;Right most column of window
;int 10h



;sub b1[17], 1

;ret



;.endif
;.endif

;.if (ball_y<107&&ball_y>77)

;.if (ball_x>261 && ball_x<307)




;neg ball_speed_y


;mov ah, 6
;mov al, 0
;mov bh, 0     ;color
;mov ch, 10     ;top row of window
;mov cl, 33     ;left most column of window
;mov dh, 12     ;Bottom row of window
;mov dl, 37     ;Right most column of window
;int 10h



;sub b1[17], 1




;.endif
;.endif






;ret
;checkbox36 endp















checkbox111 proc



.if (ball_x>21 && ball_x<67)

.if (ball_y<43&&ball_y>13)


neg ball_speed_y

mov ah, 6
mov al, 0
mov bh, 11     ;color
mov ch, 2     ;top row of window
mov cl, 3     ;left most column of window
mov dh, 4     ;Bottom row of window
mov dl, 7     ;Right most column of window
int 10h



sub b2[0], 1
add score, 1



.if (level==3)
sub b3[0], 1
add score, 1
.endif




ret

.endif
.endif


.if (ball_y<43&&ball_y>13)

.if (ball_x>21 && ball_x<67)



neg ball_speed_x

mov ah, 6
mov al, 0
mov bh, 11     ;color
mov ch, 2     ;top row of window
mov cl, 3     ;left most column of window
mov dh, 4     ;Bottom row of window
mov dl, 7     ;Right most column of window
int 10h



sub b2[0], 1
add score, 1




.if (level==3)
sub b3[0], 1
add score, 1
.endif





.endif
.endif








ret
checkbox111 endp




checkbox121 proc



.if (ball_x>69 && ball_x<115)

.if (ball_y<43&&ball_y>13)


neg ball_speed_y


mov ah, 6
mov al, 0
mov bh, 11     ;color
mov ch, 2     ;top row of window
mov cl, 9     ;left most column of window
mov dh, 4     ;Bottom row of window
mov dl, 13     ;Right most column of window
int 10h



sub b2[1], 1
add score, 1




.if (level==3)
sub b3[1], 1
add score, 1
.endif





ret


.endif
.endif


.if (ball_y<43&&ball_y>13)

.if (ball_x>69 && ball_x<115)



neg ball_speed_x


mov ah, 6
mov al, 0
mov bh, 11     ;color
mov ch, 2     ;top row of window
mov cl, 9     ;left most column of window
mov dh, 4     ;Bottom row of window
mov dl, 13     ;Right most column of window
int 10h



sub b2[1], 1
add score, 1





.if (level==3)
sub b3[1], 1
add score, 1
.endif






.endif
.endif












ret
checkbox121 endp




checkbox131 proc



.if (ball_x>117 && ball_x<163)

.if (ball_y<43&&ball_y>13)


neg ball_speed_y


mov ah, 6
mov al, 0
mov bh, 11     ;color
mov ch, 2     ;top row of window
mov cl, 15     ;left most column of window
mov dh, 4     ;Bottom row of window
mov dl, 19     ;Right most column of window
int 10h



sub b2[2], 1
add score, 1





.if (level==3)
sub b3[2], 1
add score, 1
.endif




ret


.endif
.endif



.if (ball_y<43&&ball_y>13)

.if (ball_x>117 && ball_x<163)



neg ball_speed_x


mov ah, 6
mov al, 0
mov bh, 11     ;color
mov ch, 2     ;top row of window
mov cl, 15     ;left most column of window
mov dh, 4     ;Bottom row of window
mov dl, 19     ;Right most column of window
int 10h



sub b2[2], 1
add score, 1





.if (level==3)
sub b3[2], 1
add score, 1
.endif






.endif
.endif





ret
checkbox131 endp


checkbox141 proc



.if (ball_x>165 && ball_x<211)

.if (ball_y<43&&ball_y>13)


neg ball_speed_y


mov ah, 6
mov al, 0
mov bh, 11     ;color
mov ch, 2     ;top row of window
mov cl, 21     ;left most column of window
mov dh, 4     ;Bottom row of window
mov dl, 25     ;Right most column of window
int 10h



sub b2[3], 1
add score, 1




.if (level==3)
sub b3[3], 1
add score, 1
.endif





ret


.endif
.endif


.if (ball_y<43&&ball_y>13)

.if (ball_x>165 && ball_x<211)



neg ball_speed_x


mov ah, 6
mov al, 0
mov bh, 11     ;color
mov ch, 2     ;top row of window
mov cl, 21     ;left most column of window
mov dh, 4     ;Bottom row of window
mov dl, 25     ;Right most column of window
int 10h



sub b2[3], 1
add score, 1





.if (level==3)
sub b3[3], 1
add score, 1
.endif






.endif
.endif





ret
checkbox141 endp










checkbox151 proc



.if (ball_x>213 && ball_x<259)

.if (ball_y<43&&ball_y>13)


neg ball_speed_y

mov ah, 6
mov al, 0
mov bh, 11     ;color
mov ch, 2     ;top row of window
mov cl, 27     ;left most column of window
mov dh, 4     ;Bottom row of window
mov dl, 31     ;Right most column of window
int 10h



sub b2[4], 1
add score, 1




.if (level==3)
sub b3[4], 1
add score, 1
.endif





ret


.endif
.endif


.if (ball_y<43&&ball_y>13)

.if (ball_x>213 && ball_x<259)



neg ball_speed_x

mov ah, 6
mov al, 0
mov bh, 11     ;color
mov ch, 2     ;top row of window
mov cl, 27     ;left most column of window
mov dh, 4     ;Bottom row of window
mov dl, 31     ;Right most column of window
int 10h



sub b2[4], 1
add score, 1





.if (level==3)
sub b3[4], 1
add score, 1
.endif






.endif
.endif









ret
checkbox151 endp



checkbox161 proc



.if (ball_x>261 && ball_x<307)

.if (ball_y<43&&ball_y>13)


neg ball_speed_x


mov ah, 6
mov al, 0
mov bh, 11     ;color
mov ch, 2     ;top row of window
mov cl, 33     ;left most column of window
mov dh, 4     ;Bottom row of window
mov dl, 37     ;Right most column of window
int 10h



sub b2[5], 1
add score, 1




.if (level==3)
sub b3[5], 1
add score, 1
.endif





ret


.endif
.endif


.if (ball_y<43&&ball_y>13)

.if (ball_x>261 && ball_x<307)



neg ball_speed_y


mov ah, 6
mov al, 0
mov bh, 11     ;color
mov ch, 2     ;top row of window
mov cl, 33     ;left most column of window
mov dh, 4     ;Bottom row of window
mov dl, 37     ;Right most column of window
int 10h



sub b2[5], 1
add score, 1





.if (level==3)
sub b3[5], 1
add score, 1
.endif






.endif
.endif






ret
checkbox161 endp








;next line

checkbox211 proc



.if (ball_x>21 && ball_x<67)

.if (ball_y<75&&ball_y>45)


neg ball_speed_y


mov ah, 6
mov al, 0
mov bh, 11     ;color
mov ch, 6     ;top row of window
mov cl, 3     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 7     ;Right most column of window
int 10h



sub b2[6], 1
add score, 1




.if (level==3)
sub b3[6], 1
add score, 1
.endif





ret

.endif
.endif


.if (ball_y<75&&ball_y>45)

.if (ball_x>21 && ball_x<67)



neg ball_speed_x


mov ah, 6
mov al, 0
mov bh, 11     ;color
mov ch, 6     ;top row of window
mov cl, 3     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 7     ;Right most column of window
int 10h



sub b2[6], 1
add score, 1





.if (level==3)
sub b3[6], 1
add score, 1
.endif






.endif
.endif





ret
checkbox211 endp


checkbox221 proc



.if (ball_x>69 && ball_x<115)

.if (ball_y<75&&ball_y>45)


neg ball_speed_y


mov ah, 6
mov al, 0
mov bh, 11     ;color
mov ch, 6     ;top row of window
mov cl, 9     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 13     ;Right most column of window
int 10h



sub b2[7], 1
add score, 1





.if (level==3)
sub b3[7], 1
add score, 1
.endif





ret

.endif
.endif


.if (ball_y<75&&ball_y>45)

.if (ball_x>69 && ball_x<115)



neg ball_speed_x


mov ah, 6
mov al, 0
mov bh, 11     ;color
mov ch, 6     ;top row of window
mov cl, 9     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 13     ;Right most column of window
int 10h



sub b2[7], 1
add score, 1





.if (level==3)
sub b3[7], 1
add score, 1
.endif






.endif
.endif




ret
checkbox221 endp


checkbox231 proc



.if (ball_x>117 && ball_x<163)

.if (ball_y<75&&ball_y>45)


neg ball_speed_y


mov ah, 6
mov al, 0
mov bh, 11     ;color
mov ch, 6     ;top row of window
mov cl, 15     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 19     ;Right most column of window
int 10h



sub b2[8], 1
add score, 1




.if (level==3)
sub b3[8], 1
add score, 1
.endif





ret


.endif
.endif


.if (ball_y<75&&ball_y>45)

.if (ball_x>117 && ball_x<163)



neg ball_speed_x


mov ah, 6
mov al, 0
mov bh, 11     ;color
mov ch, 6     ;top row of window
mov cl, 15     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 19     ;Right most column of window
int 10h



sub b2[8], 1
add score, 1






.if (level==3)
sub b3[8], 1
add score, 1
.endif





.endif
.endif




ret
checkbox231 endp


checkbox241 proc



.if (ball_x>165 && ball_x<211)

.if (ball_y<75&&ball_y>45)


neg ball_speed_y


mov ah, 6
mov al, 0
mov bh, 11     ;color
mov ch, 6     ;top row of window
mov cl, 21     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 25     ;Right most column of window
int 10h



sub b2[9], 1
add score, 1





.if (level==3)
sub b3[9], 1
add score, 1
.endif




ret


.endif
.endif


.if (ball_y<75&&ball_y>45)

.if (ball_x>165 && ball_x<211)



neg ball_speed_x


mov ah, 6
mov al, 0
mov bh, 11     ;color
mov ch, 6     ;top row of window
mov cl, 21     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 25     ;Right most column of window
int 10h



sub b2[9], 1
add score, 1





.if (level==3)
sub b3[9], 1
add score, 1
.endif






.endif
.endif





ret
checkbox241 endp


checkbox251 proc



.if (ball_x>213 && ball_x<259)

.if (ball_y<75&&ball_y>45)


neg ball_speed_y


mov ah, 6
mov al, 0
mov bh, 11     ;color
mov ch, 6     ;top row of window
mov cl, 27     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 31     ;Right most column of window
int 10h



sub b2[10], 1
add score, 1




.if (level==3)
sub b3[10], 1
add score, 1
.endif





ret


.endif
.endif

.if (ball_y<75&&ball_y>45)

.if (ball_x>213 && ball_x<259)



neg ball_speed_x


mov ah, 6
mov al, 0
mov bh, 11     ;color
mov ch, 6     ;top row of window
mov cl, 27     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 31     ;Right most column of window
int 10h



sub b2[10], 1
add score, 1





.if (level==3)
sub b3[10], 1
add score, 1
.endif






.endif
.endif






ret
checkbox251 endp



checkbox261 proc



.if (ball_x>261 && ball_x<307)

.if (ball_y<75&&ball_y>45)


neg ball_speed_y


mov ah, 6
mov al, 0
mov bh, 11     ;color
mov ch, 6     ;top row of window
mov cl, 33     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 37     ;Right most column of window
int 10h



sub b2[11], 1
add score, 1




.if (level==3)
sub b3[11], 1
add score, 1
.endif





ret


.endif
.endif



.if (ball_y<75&&ball_y>45)

.if (ball_x>261 && ball_x<307)



neg ball_speed_x


mov ah, 6
mov al, 0
mov bh, 11     ;color
mov ch, 6     ;top row of window
mov cl, 33     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 37     ;Right most column of window
int 10h



sub b2[11], 1
add score, 1





.if (level==3)
sub b3[11], 1
add score, 1
.endif






.endif
.endif







ret
checkbox261 endp









;next line

;checkbox31 proc



;.if (ball_x>21 && ball_x<67)

;.if (ball_y<110&&ball_y>77)


;neg ball_speed_x


;mov ah, 6
;mov al, 0
;mov bh, 0     ;color
;mov ch, 10     ;top row of window
;mov cl, 3     ;left most column of window
;mov dh, 12     ;Bottom row of window
;mov dl, 7     ;Right most column of window
;int 10h



;sub b1[12], 1


;ret


;.endif
;.endif



;.if (ball_y<107&&ball_y>77)

;.if (ball_x>21 && ball_x<67)



;neg ball_speed_y


;mov ah, 6
;mov al, 0
;mov bh, 0     ;color
;mov ch, 10     ;top row of window
;mov cl, 3     ;left most column of window
;mov dh, 12     ;Bottom row of window
;mov dl, 7     ;Right most column of window
;int 10h



;sub b1[12], 1




;.endif
;.endif








;ret
;checkbox31 endp


checkbox321 proc



.if (ball_x>69 && ball_x<115)

.if (ball_y<107&&ball_y>77)


neg ball_speed_x


mov ah, 6
mov al, 0
mov bh, 11     ;color
mov ch, 10     ;top row of window
mov cl, 9     ;left most column of window
mov dh, 12     ;Bottom row of window
mov dl, 13     ;Right most column of window
int 10h



sub b2[13], 1


add score, 1



.if (level==3)
sub b3[13], 1

add score, 1
.endif





ret


.endif
.endif


.if (ball_y<107&&ball_y>77)

.if (ball_x>69 && ball_x<115)



neg ball_speed_y


mov ah, 6
mov al, 0
mov bh, 11     ;color
mov ch, 10     ;top row of window
mov cl, 9     ;left most column of window
mov dh, 12     ;Bottom row of window
mov dl, 13     ;Right most column of window
int 10h



sub b2[13], 1

add score, 1




.if (level==3)
sub b3[13], 1
add score, 1
.endif






.endif
.endif







ret
checkbox321 endp

checkbox331 proc



.if (ball_x>117 && ball_x<163)

.if (ball_y<107&&ball_y>77)


neg ball_speed_y


mov ah, 6
mov al, 0
mov bh, 11     ;color
mov ch, 10     ;top row of window
mov cl, 15     ;left most column of window
mov dh, 12     ;Bottom row of window
mov dl, 19     ;Right most column of window
int 10h



sub b2[14], 1
add score, 1




.if (level==3)
sub b3[14], 1
add score, 1
.endif





ret


.endif
.endif

.if (ball_y<107&&ball_y>77)

.if (ball_x>117 && ball_x<163)



neg ball_speed_x


mov ah, 6
mov al, 0
mov bh, 11     ;color
mov ch, 10     ;top row of window
mov cl, 15     ;left most column of window
mov dh, 12     ;Bottom row of window
mov dl, 19     ;Right most column of window
int 10h



sub b2[14], 1
add score, 1




.if (level==3)
sub b3[14], 1
add score, 1
.endif







.endif
.endif




ret
checkbox331 endp


checkbox341 proc



.if (ball_x>165 && ball_x<211)

.if (ball_y<107&&ball_y>77)


neg ball_speed_y


mov ah, 6
mov al, 0
mov bh, 11     ;color
mov ch, 10     ;top row of window
mov cl, 21     ;left most column of window
mov dh, 12     ;Bottom row of window
mov dl, 25     ;Right most column of window
int 10h



sub b2[15], 1
add score, 1




.if (level==3)
sub b3[15], 1
add score, 1
.endif





ret


.endif
.endif


.if (ball_y<107&&ball_y>77)

.if (ball_x>165 && ball_x<211)



neg ball_speed_x


mov ah, 6
mov al, 0
mov bh, 11     ;color
mov ch, 10     ;top row of window
mov cl, 21     ;left most column of window
mov dh, 12     ;Bottom row of window
mov dl, 25     ;Right most column of window
int 10h



sub b2[15], 1
add score, 1




.if (level==3)
sub b3[15], 1
add score, 1
.endif







.endif
.endif




ret
checkbox341 endp


checkbox351 proc



.if (ball_x>216 && ball_x<256)

.if (ball_y<104&&ball_y>80)


neg ball_speed_x


mov ah, 6
mov al, 0
mov bh, 11     ;color
mov ch, 10     ;top row of window
mov cl, 27     ;left most column of window
mov dh, 12     ;Bottom row of window
mov dl, 31     ;Right most column of window
int 10h



sub b2[16], 1
add score, 1




.if (level==3)
sub b3[16], 1
add score, 1
.endif






ret

.endif
.endif




.if (ball_y<107&&ball_y>77)

.if (ball_x>213 && ball_x<257)


neg ball_speed_y


mov ah, 6
mov al, 0
mov bh, 11     ;color
mov ch, 10     ;top row of window
mov cl, 27     ;left most column of window
mov dh, 12     ;Bottom row of window
mov dl, 31     ;Right most column of window
int 10h



sub b2[16], 1

add score, 1




.if (level==3)
sub b3[16], 1
add score, 1
.endif






.endif
.endif




ret
checkbox351 endp












































checkbox1111 proc



.if (ball_x>21 && ball_x<67)

.if (ball_y<43&&ball_y>13)


neg ball_speed_y

mov ah, 6
mov al, 0
mov bh, 9     ;color
mov ch, 2     ;top row of window
mov cl, 3     ;left most column of window
mov dh, 4     ;Bottom row of window
mov dl, 7     ;Right most column of window
int 10h



sub b3[0], 1
add score, 1

ret

.endif
.endif


.if (ball_y<43&&ball_y>13)

.if (ball_x>21 && ball_x<67)



neg ball_speed_x

mov ah, 6
mov al, 0
mov bh, 9     ;color
mov ch, 2     ;top row of window
mov cl, 3     ;left most column of window
mov dh, 4     ;Bottom row of window
mov dl, 7     ;Right most column of window
int 10h



sub b3[0], 1

add score, 1


.endif
.endif








ret
checkbox1111 endp




checkbox1211 proc



.if (ball_x>69 && ball_x<115)

.if (ball_y<43&&ball_y>13)


neg ball_speed_y


mov ah, 6
mov al, 0
mov bh, 9     ;color
mov ch, 2     ;top row of window
mov cl, 9     ;left most column of window
mov dh, 4     ;Bottom row of window
mov dl, 13     ;Right most column of window
int 10h



sub b3[1], 1
add score, 1

ret


.endif
.endif


.if (ball_y<43&&ball_y>13)

.if (ball_x>69 && ball_x<115)



neg ball_speed_x


mov ah, 6
mov al, 0
mov bh, 9     ;color
mov ch, 2     ;top row of window
mov cl, 9     ;left most column of window
mov dh, 4     ;Bottom row of window
mov dl, 13     ;Right most column of window
int 10h



sub b3[1], 1
add score, 1



.endif
.endif












ret
checkbox1211 endp




checkbox1311 proc



.if (ball_x>117 && ball_x<163)

.if (ball_y<43&&ball_y>13)


neg ball_speed_y


mov ah, 6
mov al, 0
mov bh, 9     ;color
mov ch, 2     ;top row of window
mov cl, 15     ;left most column of window
mov dh, 4     ;Bottom row of window
mov dl, 19     ;Right most column of window
int 10h



sub b3[2], 1
add score, 1

ret


.endif
.endif



.if (ball_y<43&&ball_y>13)

.if (ball_x>117 && ball_x<163)



neg ball_speed_x


mov ah, 6
mov al, 0
mov bh, 9     ;color
mov ch, 2     ;top row of window
mov cl, 15     ;left most column of window
mov dh, 4     ;Bottom row of window
mov dl, 19     ;Right most column of window
int 10h



sub b3[2], 1

add score, 1


.endif
.endif





ret
checkbox1311 endp


checkbox1411 proc



.if (ball_x>165 && ball_x<211)

.if (ball_y<43&&ball_y>13)


neg ball_speed_y


mov ah, 6
mov al, 0
mov bh, 9     ;color
mov ch, 2     ;top row of window
mov cl, 21     ;left most column of window
mov dh, 4     ;Bottom row of window
mov dl, 25     ;Right most column of window
int 10h



sub b3[3], 1
add score, 1

ret


.endif
.endif


.if (ball_y<43&&ball_y>13)

.if (ball_x>165 && ball_x<211)



neg ball_speed_x


mov ah, 6
mov al, 0
mov bh, 9     ;color
mov ch, 2     ;top row of window
mov cl, 21     ;left most column of window
mov dh, 4     ;Bottom row of window
mov dl, 25     ;Right most column of window
int 10h



sub b3[3], 1

add score, 1


.endif
.endif





ret
checkbox1411 endp










checkbox1511 proc



.if (ball_x>213 && ball_x<259)

.if (ball_y<43&&ball_y>13)


neg ball_speed_y

mov ah, 6
mov al, 0
mov bh, 9     ;color
mov ch, 2     ;top row of window
mov cl, 27     ;left most column of window
mov dh, 4     ;Bottom row of window
mov dl, 31     ;Right most column of window
int 10h



sub b3[4], 1
add score, 1

ret


.endif
.endif


.if (ball_y<43&&ball_y>13)

.if (ball_x>213 && ball_x<259)



neg ball_speed_x

mov ah, 6
mov al, 0
mov bh, 9     ;color
mov ch, 2     ;top row of window
mov cl, 27     ;left most column of window
mov dh, 4     ;Bottom row of window
mov dl, 31     ;Right most column of window
int 10h



sub b3[4], 1

add score, 1


.endif
.endif









ret
checkbox1511 endp



checkbox1611 proc



.if (ball_x>261 && ball_x<307)

.if (ball_y<43&&ball_y>13)


neg ball_speed_x


mov ah, 6
mov al, 0
mov bh, 9     ;color
mov ch, 2     ;top row of window
mov cl, 33     ;left most column of window
mov dh, 4     ;Bottom row of window
mov dl, 37     ;Right most column of window
int 10h



sub b3[5], 1

add score, 1
ret


.endif
.endif


.if (ball_y<43&&ball_y>13)

.if (ball_x>261 && ball_x<307)



neg ball_speed_y


mov ah, 6
mov al, 0
mov bh, 9     ;color
mov ch, 2     ;top row of window
mov cl, 33     ;left most column of window
mov dh, 4     ;Bottom row of window
mov dl, 37     ;Right most column of window
int 10h



sub b3[5], 1

add score, 1


.endif
.endif






ret
checkbox1611 endp








;next line

checkbox2111 proc



.if (ball_x>21 && ball_x<67)

.if (ball_y<75&&ball_y>45)


neg ball_speed_y


mov ah, 6
mov al, 0
mov bh, 9     ;color
mov ch, 6     ;top row of window
mov cl, 3     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 7     ;Right most column of window
int 10h



sub b3[6], 1
add score, 1

ret

.endif
.endif


.if (ball_y<75&&ball_y>45)

.if (ball_x>21 && ball_x<67)



neg ball_speed_x


mov ah, 6
mov al, 0
mov bh, 9     ;color
mov ch, 6     ;top row of window
mov cl, 3     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 7     ;Right most column of window
int 10h



sub b3[6], 1

add score, 1


.endif
.endif





ret
checkbox2111 endp


checkbox2211 proc



.if (ball_x>69 && ball_x<115)

.if (ball_y<75&&ball_y>45)


neg ball_speed_y


mov ah, 6
mov al, 0
mov bh, 9     ;color
mov ch, 6     ;top row of window
mov cl, 9     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 13     ;Right most column of window
int 10h



sub b3[7], 1

add score, 1

ret

.endif
.endif


.if (ball_y<75&&ball_y>45)

.if (ball_x>69 && ball_x<115)



neg ball_speed_x


mov ah, 6
mov al, 0
mov bh, 9     ;color
mov ch, 6     ;top row of window
mov cl, 9     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 13     ;Right most column of window
int 10h



sub b3[7], 1


add score, 1

.endif
.endif




ret
checkbox2211 endp


checkbox2311 proc



.if (ball_x>117 && ball_x<163)

.if (ball_y<75&&ball_y>45)


neg ball_speed_y


mov ah, 6
mov al, 0
mov bh, 9     ;color
mov ch, 6     ;top row of window
mov cl, 15     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 19     ;Right most column of window
int 10h



sub b3[8], 1

add score, 1
ret


.endif
.endif


.if (ball_y<75&&ball_y>45)

.if (ball_x>117 && ball_x<163)



neg ball_speed_x


mov ah, 6
mov al, 0
mov bh, 9     ;color
mov ch, 6     ;top row of window
mov cl, 15     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 19     ;Right most column of window
int 10h



sub b3[8], 1

add score, 1


.endif
.endif




ret
checkbox2311 endp


checkbox2411 proc



.if (ball_x>165 && ball_x<211)

.if (ball_y<75&&ball_y>45)


neg ball_speed_y


mov ah, 6
mov al, 0
mov bh, 9     ;color
mov ch, 6     ;top row of window
mov cl, 21     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 25     ;Right most column of window
int 10h



sub b3[9], 1
add score, 1

ret


.endif
.endif


.if (ball_y<75&&ball_y>45)

.if (ball_x>165 && ball_x<211)



neg ball_speed_x


mov ah, 6
mov al, 0
mov bh, 9     ;color
mov ch, 6     ;top row of window
mov cl, 21     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 25     ;Right most column of window
int 10h



sub b3[9], 1


add score, 1

.endif
.endif





ret
checkbox2411 endp


checkbox2511 proc



.if (ball_x>213 && ball_x<259)

.if (ball_y<75&&ball_y>45)


neg ball_speed_y


mov ah, 6
mov al, 0
mov bh, 9     ;color
mov ch, 6     ;top row of window
mov cl, 27     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 31     ;Right most column of window
int 10h



sub b3[10], 1

add score, 1
ret


.endif
.endif

.if (ball_y<75&&ball_y>45)

.if (ball_x>213 && ball_x<259)



neg ball_speed_x


mov ah, 6
mov al, 0
mov bh, 9     ;color
mov ch, 6     ;top row of window
mov cl, 27     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 31     ;Right most column of window
int 10h



sub b3[10], 1

add score, 1


.endif
.endif






ret
checkbox2511 endp



checkbox2611 proc



.if (ball_x>261 && ball_x<307)

.if (ball_y<75&&ball_y>45)


neg ball_speed_y


mov ah, 6
mov al, 0
mov bh, 9     ;color
mov ch, 6     ;top row of window
mov cl, 33     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 37     ;Right most column of window
int 10h



sub b3[11], 1
add score, 1

ret


.endif
.endif



.if (ball_y<75&&ball_y>45)

.if (ball_x>261 && ball_x<307)



neg ball_speed_x


mov ah, 6
mov al, 0
mov bh, 9     ;color
mov ch, 6     ;top row of window
mov cl, 33     ;left most column of window
mov dh, 8     ;Bottom row of window
mov dl, 37     ;Right most column of window
int 10h



sub b3[11], 1


add score, 1

.endif
.endif







ret
checkbox2611 endp









;next line

;checkbox31 proc



;.if (ball_x>21 && ball_x<67)

;.if (ball_y<110&&ball_y>77)


;neg ball_speed_x


;mov ah, 6
;mov al, 0
;mov bh, 0     ;color
;mov ch, 10     ;top row of window
;mov cl, 3     ;left most column of window
;mov dh, 12     ;Bottom row of window
;mov dl, 7     ;Right most column of window
;int 10h



;sub b1[12], 1


;ret


;.endif
;.endif



;.if (ball_y<107&&ball_y>77)

;.if (ball_x>21 && ball_x<67)



;neg ball_speed_y


;mov ah, 6
;mov al, 0
;mov bh, 0     ;color
;mov ch, 10     ;top row of window
;mov cl, 3     ;left most column of window
;mov dh, 12     ;Bottom row of window
;mov dl, 7     ;Right most column of window
;int 10h



;sub b1[12], 1




;.endif
;.endif








;ret
;checkbox31 endp


checkbox3211 proc



.if (ball_x>69 && ball_x<115)

.if (ball_y<107&&ball_y>77)


neg ball_speed_x


mov ah, 6
mov al, 0
mov bh, 9     ;color
mov ch, 10     ;top row of window
mov cl, 9     ;left most column of window
mov dh, 12     ;Bottom row of window
mov dl, 13     ;Right most column of window
int 10h



sub b3[13], 1
add score, 1

ret


.endif
.endif


.if (ball_y<107&&ball_y>77)

.if (ball_x>69 && ball_x<115)



neg ball_speed_y


mov ah, 6
mov al, 0
mov bh, 9     ;color
mov ch, 10     ;top row of window
mov cl, 9     ;left most column of window
mov dh, 12     ;Bottom row of window
mov dl, 13     ;Right most column of window
int 10h



sub b3[13], 1

add score, 1


.endif
.endif







ret
checkbox3211 endp

checkbox3311 proc



.if (ball_x>117 && ball_x<163)

.if (ball_y<107&&ball_y>77)


neg ball_speed_y


mov ah, 6
mov al, 0
mov bh, 9     ;color
mov ch, 10     ;top row of window
mov cl, 15     ;left most column of window
mov dh, 12     ;Bottom row of window
mov dl, 19     ;Right most column of window
int 10h



sub b3[14], 1
add score, 1

ret


.endif
.endif

.if (ball_y<107&&ball_y>77)

.if (ball_x>117 && ball_x<163)



neg ball_speed_x


mov ah, 6
mov al, 0
mov bh, 9     ;color
mov ch, 10     ;top row of window
mov cl, 15     ;left most column of window
mov dh, 12     ;Bottom row of window
mov dl, 19     ;Right most column of window
int 10h



sub b3[14], 1

add score, 1


.endif
.endif




ret
checkbox3311 endp


checkbox3411 proc



.if (ball_x>165 && ball_x<211)

.if (ball_y<107&&ball_y>77)


neg ball_speed_y


mov ah, 6
mov al, 0
mov bh, 9     ;color
mov ch, 10     ;top row of window
mov cl, 21     ;left most column of window
mov dh, 12     ;Bottom row of window
mov dl, 25     ;Right most column of window
int 10h



sub b3[15], 1
add score, 1

ret


.endif
.endif


.if (ball_y<107&&ball_y>77)

.if (ball_x>165 && ball_x<211)



neg ball_speed_x


mov ah, 6
mov al, 0
mov bh, 9     ;color
mov ch, 10     ;top row of window
mov cl, 21     ;left most column of window
mov dh, 12     ;Bottom row of window
mov dl, 25     ;Right most column of window
int 10h



sub b3[15], 1

add score, 1


.endif
.endif




ret
checkbox3411 endp


checkbox3511 proc



.if (ball_x>216 && ball_x<256)

.if (ball_y<104&&ball_y>80)


neg ball_speed_x


mov ah, 6
mov al, 0
mov bh, 9     ;color
mov ch, 10     ;top row of window
mov cl, 27     ;left most column of window
mov dh, 12     ;Bottom row of window
mov dl, 31     ;Right most column of window
int 10h



sub b3[16], 1
add score, 1


ret

.endif
.endif




.if (ball_y<107&&ball_y>77)

.if (ball_x>213 && ball_x<257)


neg ball_speed_y


mov ah, 6
mov al, 0
mov bh, 9     ;color
mov ch, 10     ;top row of window
mov cl, 27     ;left most column of window
mov dh, 12     ;Bottom row of window
mov dl, 31     ;Right most column of window
int 10h



sub b3[16], 1


add score, 1

.endif
.endif




ret
checkbox3511 endp

























































































































paddle1 proc










hi:

mov ah, 1
int 16h    ; if not input, zero flag is 1

;ah mein scan hai, al mein ascii


.if(ah!=48h)
.if(ah!=50h)
.if(ah!=4bh)
.if(ah!=4dh)
.if(al!=27)




ret

.endif
.endif
.endif
.endif
.endif









mov ah, 0
int 16h    ; if not input, zero flag is 1




cmp al, 27
jne hiii1


call pause

jmp finito


hiii1:


cmp ah, 4bh
je left

cmp ah, 4dh
je right



left:

;sub cx, 1

;mov al, 1110b
;mov ah, 0ch
;int 10h

cmp v1, 0
;cmp vv5, 2
je nozero





call leftie









sub vv5, 8
sub vv6, 8

sub v3, 1
sub v4, 1

nozero:

jmp hi

right:

;add cx, 1

;mov al, 1110b
;mov ah, 0ch









cmp v4, 39
;cmp vv6, 318
je nomax







call rightie




add vv5, 8
add vv6, 8


add v1, 1
add v2, 1

nomax:

int 10h

jmp hi


finito:



ret
paddle1 endp




leftscreen proc

mov bx,0
push bx
mov bx,0
push bx
mov cx,199
l1:
   push cx
   mov ah,0ch
   mov al,4
   mov cx,x
   mov dx,y
   int 10h
   inc y
   pop cx
loop l1





ret 
leftscreen endp







rightscreen proc



mov bx,199
push bx
mov bx,319
push bx


mov cx,199
l3:
  push cx
   mov ah,0ch
   mov al,15
   mov bh, 9
   mov cx,x
   mov dx,y
   int 10h
   dec y
   pop cx


loop l3




ret 
rightscreen endp








upscreen proc

mov bx,199
push bx
mov bx,319
push bx


mov cx,319
l4:
  push cx
   mov ah,0ch
   mov al,15
   mov cx,x
   mov dx,y
   int 10h
   dec x
   pop cx


loop l4


ret 
upscreen endp










downscreen proc


mov bx,0
push bx
mov bx,319
push bx

mov cx,319
l2:
    push cx
   mov ah,0ch
   mov al,15
   mov cx,x
   mov dx,y
   int 10h
   inc x
   
   pop cx

loop l2






ret 
downscreen endp












check_level proc


call start_comparison




ret
check_level endp










start_comparison proc


mov switch_temp, 0

mov si, 0
mov ax, 0

.if(level==1)

mov al, switch_temp

starttt:

.if(si==18)
jmp switching
.endif


.if(b1[si]==0)

inc si


jmp starttt

.endif



jmp endswitching


switching:

mov switch, 1





endswitching:
ret
.endif





.if(level==2)

mov si, 0
mov ax, 0




startttt:

.if(si==18)
jmp switching2
.endif


.if(b2[si]==0)

inc si


jmp startttt

.endif



jmp endswitching2


switching2:

mov switch, 2





endswitching2:



.endif











ret
start_comparison endp


























pause proc

mov al, 0

wapis:

mov ah, 0
int 16h    ; if not input, zero flag is 1




cmp al, 27
jne wapis


ret
pause endp





makinghearts proc



.if(life==3)

mov ah, 2
mov dh, 100   ;row
mov dl, 16     ;column
int 10h

mov al,3    ;ASCII code of Character 
mov bx,0
mov bl,0100b   ;Green color
mov cx,3       ;repetition count
mov ah,09h
int 10h

.endif


.if(life==2)

mov ah, 2
mov dh, 100   ;row
mov dl, 16     ;column
int 10h

mov al,3    ;ASCII code of Character 
mov bx,0
mov bl,0100b   ;Green color
mov cx,2       ;repetition count
mov ah,09h
int 10h



mov ah, 2
mov dh, 100   ;row
mov dl, 16     ;column
int 10h

mov al,0    ;ASCII code of Character 
mov bx,0
mov bl,0100b   ;Green color
mov cx,1       ;repetition count
mov ah,09h
int 10h



.endif


.if(life==1)

mov ah, 2
mov dh, 100   ;row
mov dl, 16     ;column
int 10h

mov al,3    ;ASCII code of Character 
mov bx,0
mov bl,0100b   ;Green color
mov cx,1       ;repetition count
mov ah,09h
int 10h



mov ah, 2
mov dh, 100   ;row
mov dl, 16     ;column
int 10h

mov al,0    ;ASCII code of Character 
mov bx,0
mov bl,0100b   ;Green color
mov cx,2       ;repetition count
mov ah,09h
int 10h



.endif


.if(life==0)



mov ah, 2
mov dh, 100   ;row
mov dl, 16     ;column
int 10h

mov al,0    ;ASCII code of Character 
mov bx,0
mov bl,0100b   ;Green color
mov cx,3       ;repetition count
mov ah,09h
int 10h



.endif








ret
makinghearts endp


















































main:


;video mode (graphic) 
mov ah, 0
mov al, 13h    ;320x200
int 10h

















;outline



mov bx,x
push bx
mov bx,y
push bx
mov cx,199
l1:
   push cx
   mov ah,0ch
   mov al,4
   mov cx,x
   mov dx,y
   int 10h
   inc y
   pop cx
   loop l1
mov cx,319
l2:
    push cx
   mov ah,0ch
   mov al,15
   mov cx,x
   mov dx,y
   int 10h
   inc x
   
   pop cx

loop l2
mov cx,199
l3:
  push cx
   mov ah,0ch
   mov al,15
   mov bh, 9
   mov cx,x
   mov dx,y
   int 10h
   dec y
   pop cx


loop l3
mov cx,319
l4:
  push cx
   mov ah,0ch
   mov al,15
   mov cx,x
   mov dx,y
   int 10h
   dec x
   pop cx


loop l4


















;dabbas




call box11

call box12

call box13

call box14

call box15

call box16

call box21

call box22

call box23

call box24

call box25

call box26

;call box31

call box32

call box33

call box34

call box35

;call box36










; BASE LINE











;mov v1, 10
;mov v2, 16
;mov v3, 9
;mov v4, 15



;mov ch, 20
;mov cl, 14
;mov dh, 21
;mov dl, 14
;

;mov v1, cl
;mov v2, dl

;add v1, 1
;add v2, 1


;mov ah, 6
;mov al, 0
;mov bh, 11     ;color
;mov ch, 20     ;top row of window
;mov cl, v1     ;left most column of window
;mov dh, 21     ;Bottom row of window
;mov dl, v2     ;Right most column of window
;int 10h




MOV CX, ball_x    ;x-cordinate (column)
MOV DX, ball_y   ;y-cordinate (row)









ball_horizontal:

MOV AL, 1110b  ;yellow color
MOV AH, 0CH 
INT 10H

inc cx


mov ax, cx
sub ax, ball_x
cmp ax, ball_size
jng ball_horizontal



mov cx, ball_x
inc dx
mov ax, dx
sub ax, ball_y
cmp ax, ball_size
jng ball_horizontal







;paddle ka creation



mov ah, 6
mov al, 0
mov bh, 4     ;color
mov ch, 22     ;top row of window
mov cl, 10     ;left most column of window
mov dh, 23     ;Bottom row of window
mov dl, 15     ;Right most column of window
int 10h










;MOV CX, temppball_x    ;x-cordinate (column)
;MOV DX, temppball_y   ;y-cordinate (row)











;ball_horizontal33:

;MOV AL, 1110b  ;yellow color
;MOV AH, 0CH 
;INT 10H

;inc cx


;mov ax, cx
;sub ax, temppball_x
;cmp ax, 47
;jng ball_horizontal33



;mov cx, temppball_x
;inc dx
;mov ax, dx
;sub ax, temppball_y
;cmp ax, 15
;jng ball_horizontal33






















;making hearts









lives1:

mov ball_x, 100

mov ball_y, 170


mov ax, ball_speed_l1_y


mov ball_speed_x, ax


mov ax, ball_speed_l1_y
mov ball_speed_y, ax


mov ball_notoriginal_x, 100
mov ball_notoriginal_y, 170


mov escape, 0

mov time_aux, 0























;beginning of the movement of the ball



check_time:

mov ah, 2ch     ;get the system time
int 21h         ;ch = hrs, cl = minutes, dh = seconds, dl = seconds/100













cmp dl, time_aux   ;is the current time equal to the prev one
je check_time	   ; if same, check again




;if different, draw/move etc




mov time_aux, dl   ;update time



;change speed of the ball




call ball_speed_ftn


call makinghearts

cmp escape, 1
je escaped


call check_level

.if(switch==1)
jmp next_level
.endif

;inc ball_x         ;incrementing the x axis of ball by 1
;inc ball_y         ;incrementing the y axis of ball by 1






call shadow_ball


call create_ball

call paddle1

jmp check_time


escaped:


dec life



;ending of the movement of the ball


.if(life==0)
je dead

.endif

jmp lives1


























next_level:










;video mode (graphic) 
mov ah, 0
mov al, 13h    ;320x200
int 10h

















;outline



mov bx,x
push bx
mov bx,y
push bx
mov cx,199
l11:
   push cx
   mov ah,0ch
   mov al,4
   mov cx,x
   mov dx,y
   int 10h
   inc y
   pop cx
   loop l11
mov cx,319
l22:
    push cx
   mov ah,0ch
   mov al,15
   mov cx,x
   mov dx,y
   int 10h
   inc x
   
   pop cx

loop l22
mov cx,199
l33:
  push cx
   mov ah,0ch
   mov al,15
   mov bh, 9
   mov cx,x
   mov dx,y
   int 10h
   dec y
   pop cx


loop l33
mov cx,319
l44:
  push cx
   mov ah,0ch
   mov al,15
   mov cx,x
   mov dx,y
   int 10h
   dec x
   pop cx


loop l44

















;dabbas




call box111

call box121

call box131

call box141

call box151

call box161

call box211

call box221

call box231

call box241

call box251

call box261

;call box31

call box321

call box331

call box341

call box351

;call box36








































;paddle ka creation



mov ah, 6
mov al, 0
mov bh, 4     ;color
mov ch, 22     ;top row of window
mov cl, 10     ;left most column of window
mov dh, 23     ;Bottom row of window
mov dl, 14     ;Right most column of window
int 10h




















mov v1, 10
mov v2, 15
mov v3, 9
mov v4, 14


mov vv5, 80
mov vv6, 120





lives2:






mov level, 2

mov ball_x, 100

mov ball_y, 170


mov ax, ball_speed_l2_y


mov ball_speed_x, ax


mov ax, ball_speed_l2_y
mov ball_speed_y, ax


mov ball_temp_x, 100
mov ball_temp_y, 170


mov ball_notoriginal_x, 100
mov ball_notoriginal_y, 170


mov escape, 0

mov time_aux, 0










;beginning of the movement of the ball



check_time2:

mov ah, 2ch     ;get the system time
int 21h         ;ch = hrs, cl = minutes, dh = seconds, dl = seconds/100













cmp dl, time_aux   ;is the current time equal to the prev one
je check_time2   ; if same, check again




;if different, draw/move etc




mov time_aux, dl   ;update time



;change speed of the ball




call ball_speed_ftn



cmp escape, 1
je escaped2


call check_level

.if(switch==2)
jmp next_level2
.endif

;inc ball_x         ;incrementing the x axis of ball by 1
;inc ball_y         ;incrementing the y axis of ball by 1






call shadow_ball



call create_ball

call paddle1

jmp check_time2


escaped2:


dec life



;ending of the movement of the ball

.if(life==0)
je dead

.endif

jmp lives2



next_level2:


















;video mode (graphic) 
mov ah, 0
mov al, 13h    ;320x200
int 10h

















;outline



mov bx,x
push bx
mov bx,y
push bx
mov cx,199
l111:
   push cx
   mov ah,0ch
   mov al,4
   mov cx,x
   mov dx,y
   int 10h
   inc y
   pop cx
   loop l111
mov cx,319
l222:
    push cx
   mov ah,0ch
   mov al,15
   mov cx,x
   mov dx,y
   int 10h
   inc x
   
   pop cx

loop l222
mov cx,199
l333:
  push cx
   mov ah,0ch
   mov al,15
   mov bh, 9
   mov cx,x
   mov dx,y
   int 10h
   dec y
   pop cx


loop l333
mov cx,319
l444:
  push cx
   mov ah,0ch
   mov al,15
   mov cx,x
   mov dx,y
   int 10h
   dec x
   pop cx


loop l444

















;dabbas




call box1111

call box1211

call box1311

call box1411

call box1511

call box1611

call box2111

call box2211

call box2311

call box2411

call box2511

call box2611

;call box311

call box3211

call box3311

call box3411

call box3511

;call box361








































;paddle ka creation



mov ah, 6
mov al, 0
mov bh, 4     ;color
mov ch, 22     ;top row of window
mov cl, 10     ;left most column of window
mov dh, 23     ;Bottom row of window
mov dl, 14     ;Right most column of window
int 10h




















mov v1, 10
mov v2, 15
mov v3, 9
mov v4, 14


mov vv5, 80
mov vv6, 120





lives3:






mov level, 3

mov ball_x, 100

mov ball_y, 170


mov ax, ball_speed_l3_y


mov ball_speed_x, ax


mov ax, ball_speed_l3_y
mov ball_speed_y, ax


mov ball_temp_x, 100
mov ball_temp_y, 170


mov ball_notoriginal_x, 100
mov ball_notoriginal_y, 170


mov escape, 0

mov time_aux, 0










;beginning of the movement of the ball



check_time3:

mov ah, 2ch     ;get the system time
int 21h         ;ch = hrs, cl = minutes, dh = seconds, dl = seconds/100













cmp dl, time_aux   ;is the current time equal to the prev one
je check_time3   ; if same, check again




;if different, draw/move etc




mov time_aux, dl   ;update time



;change speed of the ball




call ball_speed_ftn



cmp escape, 1
je escaped3


call check_level

.if(switch==3)
jmp next_level3
.endif

;inc ball_x         ;incrementing the x axis of ball by 1
;inc ball_y         ;incrementing the y axis of ball by 1






call shadow_ball



call create_ball

call paddle1

jmp check_time3


escaped3:


dec life



;ending of the movement of the ball

.if(life==0)
je dead

.endif

jmp lives3



next_level3:







































;idhar



;hi:

;mov ah, 0
;int 16h    ; if not input, zero flag is 1

;;ah mein scan hai, al mein ascii




;cmp al, 13
;je fin



;cmp ah, 4bh
;je left

;cmp ah, 4dh
;je right



;left:

;;sub cx, 1

;;mov al, 1110b
;;mov ah, 0ch
;;int 10h

;cmp v1, 0
;je nozero

;call leftie

;sub v3, 1
;sub v4, 1

;nozero:

;jmp hi

;right:

;;add cx, 1

;;mov al, 1110b
;;mov ah, 0ch

;cmp v4, 39
;je nomax

;call rightie

;add v1, 1
;add v2, 1

;nomax:

;int 10h

;jmp hi









dead:
call gameover
gameover proc

mov ah,0
mov al,3
int 10h

mov ah,06h
mov bh,07
mov cx,0000
mov dx,184Fh
int 10h
mov ah,00
mov al,04
int 10h
mov cx,100
mov dx,50
back:
mov ah,0ch
mov al,01
int 10h
inc cx
cmp cx,700
jnz back

;----------
;shift cursor
mov ah,2
mov bh,0
mov dh,5
mov dl,8
int 10h


mov bl,10000001b  
mov dx,offset gmsg
mov ah,09h
int 21h


;shift cursor
mov ah,2
mov bh,0
mov dh,7
mov dl,8
int 10h

mov bl, 10000011b  ;1110b
mov dx,offset gmsg2
mov ah,09h
int 21h



;shift cursor
mov ah,2
mov bh,0
mov dh,9
mov dl,8
int 10h

mov bl, 10000011b  ;1110b
mov dx,offset gmsg3
mov ah,09h
int 21h


;shift cursor
mov ah,2
mov bh,0
mov dh,11
mov dl,8
int 10h

mov bl, 10000011b  ;1110b
mov dx,offset gmsg4
mov ah,09h
int 21h


mov dl, score
Mov ah, 2
int 21h








mov ah,07
int 21h
cmp al,112  ;ascii for enter
je  startgame
jne exit3

exit3:
mov ah,4ch
int 21h
gameover endp




startgame endp
;-----------------------



;--------------------------------------------------------

exit2:
mov ah,4ch
int 21h


instructions endp



exit1:
mov ah,4ch
int 21h


;-----------------------------------------------------
ret
welcome endp

;----------------------------------------------


exit:
mov ah,4ch
int 21h
main1 endp
end