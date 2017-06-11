largura = 900
altura = 600
carro1 = {x= 0 , y = 515, w= 50, h = 20}
carroAzul1 = {x= -250 , y = 515, w= 50, h = 20}
carro2 = {x= 0 , y = 465, w= 50, h = 20}
carro3 = {x= 0 , y = 415, w= 50, h = 20}
carro4 = {x= 0 , y = 365, w= 50, h = 20}
carroAzul2 = {x= 250 , y = 365, w= 50, h = 20}
carro5 = {x= 0 , y = 315, w= 50, h = 20}
carro6 = {x= 900 , y = 265, w= 50, h = 20}
carro7 = {x= 900 , y = 215, w= 50, h = 20}
carro8 = {x= 900 , y = 165, w= 50, h = 20}
carro9 = {x= 900 , y = 115, w= 50, h = 20}
carroAzul3 = {x= 250 , y = 115, w= 50, h = 20}
carro10 = {x= 900, y = 65, w= 50, h = 20}
galinha = {x = 225, y = 33, w = 30, h = 30}
galinha2 = {x = 675, y = 565, w = 30, h = 30}
pontos=0
pontos2=0
tempo = 0
segundos = 0
segundos2 = 0
gameOver = false
ovos={}
--Escopo: Varíavel ovos é global
--Tempo de vida: até que haja colisão entre os objetos, sendo zerado após isso.
--Alocação: alocação é realizada ao iniciar o jogo e e aumentada sempre que um objeto é criado.
--Desalocação: objetos são desalocados ao colidirem.

ovos2={}
posicao=0
ovo=0
ovo2=0

function love.keypressed(key)
  if key == "space" then
    ovos[#ovos+1] = {x=galinha.x, y=galinha.y, w=galinha.w,h=galinha.h}
--Escopo: objeto criado é global
--Tempo de vida: objetos irão durar no array até que haja alguma colisão com outro objeto.
--Alocação: a alocação do objeto no array e realizada na função acima.
--Desalocação: quando ocorrer colisão.

  elseif key == "up" then
    	ovos2[#ovos2+1] = {x=galinha2.x, y=galinha2.y, w=galinha2.w,h=galinha2.h}
   end 
end

function love.load()
	love.window.setMode(largura,altura)
	love.graphics.setBackgroundColor(168,168,168)
	carro1_d = love.graphics.newImage("spriteCarro1_d.png")
	carro1_e = love.graphics.newImage("spriteCarro1_e.png")
	carro2_d = love.graphics.newImage("spriteCarro2_d.png")
	carro2_e = love.graphics.newImage("spriteCarro2_e.png")
	galinhas = love.graphics.newImage("galinha.png")
	somPonto = love.audio.newSource("score.wav", "stream")
	somGalinha = love.audio.newSource("galinha.wav", "stream")
	ovoSprite = love.graphics.newImage("ovo.png")
end

function desenhaCarro()

	love.graphics.draw(carro1_d,carro1.x,carro1.y)
	love.graphics.draw(carro2_d,carroAzul1.x,carroAzul1.y,0,1.3,1.3)
	love.graphics.draw(carro1_d,carro2.x,carro2.y)
	love.graphics.draw(carro1_d,carro3.x,carro3.y)
	love.graphics.draw(carro1_d,carro4.x,carro4.y)
	love.graphics.draw(carro2_d,carroAzul2.x,carroAzul2.y,0,1.3,1.3)
	love.graphics.draw(carro1_d,carro5.x,carro5.y)
	love.graphics.draw(carro1_e,carro6.x,carro6.y)
	love.graphics.draw(carro1_e,carro7.x,carro7.y)
	love.graphics.draw(carro1_e,carro8.x,carro8.y)
	love.graphics.draw(carro1_e,carro9.x,carro9.y)
	love.graphics.draw(carro2_e,carroAzul3.x,carroAzul3.y,0,1.3,1.3)
	love.graphics.draw(carro1_e,carro10.x,carro10.y)	
end	

function andarCarro_d(objeto,velocidade)
		if (objeto.x <= largura) then
			
		objeto.x = objeto.x + velocidade

		elseif(objeto.x > largura) then
			objeto.x = 0
		end		
end	

function andarCarro_e(objeto,velocidade)
		if (objeto.x >= 0) then
			
		objeto.x = objeto.x - velocidade

		elseif(objeto.x < 0) then
			objeto.x = largura
		end	
end	

function andarCarro2_d(objeto,velocidade)
		if (objeto.x <= largura) then
				
			objeto.x = objeto.x + velocidade
			
		elseif(objeto.x > largura) then
			objeto.x = 0
		end
end	

function andarCarro2_e(objeto,velocidade)
	if (objeto.x >= 0) then
			
			objeto.x = objeto.x - velocidade

		elseif(objeto.x  < 0) then
			objeto.x = largura
		end
end	

function andarGalinha()
 	
 	if love.keyboard.isDown("a") then
 		galinha.x = galinha.x-2		

 	elseif love.keyboard.isDown("d") then
 		galinha.x = galinha.x+2

 	end

 	if love.keyboard.isDown("left") then
 		galinha2.x = galinha2.x-2

 	elseif love.keyboard.isDown("right") then
 		galinha2.x = galinha2.x+2	

 	end
end

function collides (objeto1, objeto2)
    return (objeto1.x+objeto1.w >= objeto2.x) and (objeto1.x <= objeto2.x+objeto2.w) and
           (objeto1.y+objeto1.h >= objeto2.y) and (objeto1.y <= objeto2.y+objeto2.h)
end

function love.update(dt)
	
	segundos = segundos + dt

	tempo = math.floor(segundos)

		andarCarro_d(carro1,150*dt)
		andarCarro_d(carro2,100*dt)
		andarCarro_d(carro3,300*dt)
		andarCarro_d(carro4,500*dt)
		andarCarro_d(carro5,700*dt)
		andarCarro_e(carro6,200*dt)
		andarCarro_e(carro7,600*dt)
		andarCarro_e(carro8,500*dt)
		andarCarro_e(carro9,150*dt)
		andarCarro_e(carro10,100*dt)
	    andarCarro2_d(carroAzul1,150*dt)
	    andarCarro2_d(carroAzul2,510*dt)
	    andarCarro2_e(carroAzul3,150*dt)
	    andarGalinha()
	    for i,ovo in ipairs(ovos) do

	    	ovo.y = ovo.y + 300*dt

	    	if(ovo.y>=600) then

 			love.audio.play(somPonto)
 			pontos = pontos +1
 			table.remove(ovos,i)
 			end

	    	if collides(ovo,carro1) then
	    		table.remove(ovos,i)
	    
	    	elseif collides(ovo,carro2) then
	    		table.remove(ovos,i)
	    	elseif collides(ovo,carro3) then
	    		table.remove(ovos,i)
	    	elseif collides(ovo,carro4) then
	    		table.remove(ovos,i)
	    	elseif collides(ovo,carro5) then
	    		table.remove(ovos,i)
	    	elseif collides(ovo,carro6) then
	    	table.remove(ovos,i)
	   	 	elseif collides(ovo,carro7) then
	    		table.remove(ovos,i)
	    	elseif collides(ovo,carro8) then
	    		table.remove(ovos,i)
	    	elseif collides(ovo,carro9) then
	    		table.remove(ovos,i)
	    	elseif collides(ovo,carro10) then
	    		table.remove(ovos,i)
	    	elseif collides(ovo,carroAzul1) then
	    		table.remove(ovos,i)
	    	elseif collides(ovo,carroAzul2) then
	    		table.remove(ovos,i)
	    	elseif collides(ovo,carroAzul3) then
	    		table.remove(ovos,i)												
	    	end	
	   end 

	   for i,ovo2 in ipairs(ovos2) do

	    	ovo2.y = ovo2.y - 300*dt

	    	if(ovo2.y<=0) then

 			love.audio.play(somPonto)
 			pontos2 = pontos2 +1
 			table.remove(ovos2,i)
 			end

	    	if collides(ovo2,carro1) then
	    		table.remove(ovos2,i)
	    
	    	elseif collides(ovo2,carro2) then
	    		table.remove(ovos2,i)
	    	elseif collides(ovo2,carro3) then
	    		table.remove(ovos2,i)
	    	elseif collides(ovo2,carro4) then
	    		table.remove(ovos2,i)
	    	elseif collides(ovo2,carro5) then
	    		table.remove(ovos2,i)
	    	elseif collides(ovo2,carro6) then
	    	table.remove(ovos2,i)
	   	 	elseif collides(ovo2,carro7) then
	    		table.remove(ovos2,i)
	    	elseif collides(ovo2,carro8) then
	    		table.remove(ovos2,i)
	    	elseif collides(ovo2,carro9) then
	    		table.remove(ovos2,i)
	    	elseif collides(ovo2,carro10) then
	    		table.remove(ovos2,i)
	    	elseif collides(ovo2,carroAzul1) then
	    		table.remove(ovos2,i)
	    	elseif collides(ovo2,carroAzul2) then
	    		table.remove(ovos2,i)
	    	elseif collides(ovo2,carroAzul3) then
	    		table.remove(ovos2,i)
	    													
	    	end	
	   end 
end


function love.draw()

	if(tempo>=70) then

    	love.graphics.setBackgroundColor(0,0,0)
    	love.graphics.setColor(255,255,255)
    	love.audio.stop( )
    	love.graphics.print("FIM de JOGO",350,300,0,3,3)
    	if(pontos>pontos2) then
    		love.graphics.setColor(255,255,255)
    		love.graphics.print("Jogador 1 e o vencedor",320,350,0,2,2)
    		--love.timer.sleep(1)
    	elseif(pontos<pontos2) then
    		love.graphics.setColor(255,255,255)
    		love.graphics.print("Jogador 2 e o vencedor",320,350,0,2,2)
    		--love.timer.sleep(1)
    	elseif(pontos==pontos2) then
    		love.graphics.setColor(255,255,255)
    		love.graphics.print("Empate!!",400,350,0,2,2)	
    		--love.timer.sleep(1)
    	end	

	elseif (tempo<70) then
	
		love.graphics.setColor(0,0,0)
		love.graphics.line(0,70, 900,70)

		love.graphics.setColor(0,0,0)
		love.graphics.line(0,40, 900,40)

		love.graphics.setColor(0,0,0)
		love.graphics.line(0,570,900,570)

		love.graphics.setColor(205,205,205)
		love.graphics.rectangle('fill',0,570,900,30)

		love.graphics.setColor(205,205,205)
		love.graphics.rectangle('fill',0,40,900,30)

		love.graphics.line(0,520,900,520)
		love.graphics.line(0,470,900,470)
		love.graphics.line(0,420,900,420)
		love.graphics.line(0,370,900,370)
		love.graphics.line(0,320,900,320)
		love.graphics.line(0,270,900,270)
		love.graphics.line(0,220,900,220)
		love.graphics.line(0,170,900,170)
		love.graphics.line(0,120,900,120)
		
		love.graphics.draw(galinhas,galinha.x,galinha.y)
		love.graphics.draw(galinhas,galinha2.x,galinha2.y)

		desenhaCarro()

		for i,ovo in ipairs(ovos) do
     		love.graphics.draw(ovoSprite, ovo.x, ovo.y)
	    end

	    for i,ovo2 in ipairs(ovos2) do
     		love.graphics.draw(ovoSprite, ovo2.x, ovo2.y)
	    end

	    love.graphics.setColor(0,0,0)
	    love.graphics.print("Pontuação: "..pontos,150,5,0,2,2)
	    love.graphics.setColor(0,0,0)
	    love.graphics.print("Pontuação: "..pontos2,580,5,0,2,2)
	    love.graphics.setColor(0,0,0)
	    love.graphics.print("Tempo: "..tempo,385,5,0,2,2)
	end   
end	
