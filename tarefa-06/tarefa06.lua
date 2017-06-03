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
galinha = {x = 225, y = 565, w = 30, h = 30}

galinha2 = {x = 675, y = 565, w = 30, h = 30}
-- Exemplo de array

pontos=0
pontos2=0
tempo = 0
segundos = 0
gameOver = false

function love.load()
	love.window.setMode(largura,altura,{resizable=true,minwidth=800, minheight=500})
	--Exemplo de registro
	
	love.graphics.setBackgroundColor(168,168,168)
	carro1_d = love.graphics.newImage("spriteCarro1_d.png")
	carro1_e = love.graphics.newImage("spriteCarro1_e.png")
	carro2_d = love.graphics.newImage("spriteCarro2_d.png")
	carro2_e = love.graphics.newImage("spriteCarro2_e.png")
	galinhas = love.graphics.newImage("galinha.png")
	somPonto = love.audio.newSource("score.wav", "stream")
	somGalinha = love.audio.newSource("galinha.wav", "stream")
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
		if (objeto.x < largura) then
			
		objeto.x = objeto.x + velocidade

		elseif(objeto.x == largura) then
			objeto.x = 0
		end
	
		
end	

function andarCarro_e(objeto,velocidade)
		if (objeto.x > 0) then
			
		objeto.x = objeto.x - velocidade

		elseif(objeto.x == 0) then
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
 	
 	if love.keyboard.isDown("w") then
		-- Exemplo de enumeração
		
 		galinha.y = galinha.y-3

 		if(galinha.y<30) then

 			love.audio.play(somPonto)
 			pontos = pontos + 1
 			galinha.y=565 
 		end	

 	elseif love.keyboard.isDown("s") then
 		galinha.y = galinha.y+3	

 	end

 	if love.keyboard.isDown("up") then
 		galinha2.y = galinha2.y-3

 		if(galinha2.y<30) then

 			love.audio.play(somPonto)
 			pontos2 = pontos2 + 1
 			galinha2.y=565 
 		end	

 	elseif love.keyboard.isDown("down") then
 		galinha2.y = galinha2.y+3	

 	end		
end

function collides (objeto1, objeto2)
    return (objeto1.x+objeto1.w >= objeto2.x) and (objeto1.x <= objeto2.x+objeto2.w) and
           (objeto1.y+objeto1.h >= objeto2.y) and (objeto1.y <= objeto2.y+objeto2.h)
end

function love.update(dt)
	
	segundos = segundos + dt
	
	tempo = math.floor(segundos)

		andarCarro_d(carro1,1.5)
		andarCarro_d(carro2,1)
		andarCarro_d(carro3,3)
		andarCarro_d(carro4,5)
		andarCarro_d(carro5,9)
		andarCarro_e(carro6,2)
		andarCarro_e(carro7,6)
		andarCarro_e(carro8,4)
		andarCarro_e(carro9,9)
		andarCarro_e(carro10,5)
	    andarCarro2_d(carroAzul1,1.5)
	    andarCarro2_d(carroAzul2,5.1)
	    andarCarro2_e(carroAzul3,9)
	    andarGalinha()

		if collides(galinha, carro1) then
			love.audio.play(somGalinha)
	        galinha.x = 225
	        galinha.y = 565

	    elseif collides(galinha, carro2) then
	        galinha.x = 225
	        galinha.y = 565
	    love.audio.play(somGalinha)
	    elseif collides(galinha, carro3) then
	        galinha.x = 225
	        galinha.y = 565
	    love.audio.play(somGalinha)
	    elseif collides(galinha, carro4) then
	        galinha.x = 225
	        galinha.y = 565
	    love.audio.play(somGalinha)
	    elseif collides(galinha, carro5) then
	        galinha.x = 225
	        galinha.y = 565
	    love.audio.play(somGalinha)
	    elseif collides(galinha, carro6) then
	        galinha.x = 225
	        galinha.y = 565
	    love.audio.play(somGalinha)
	    elseif collides(galinha, carro7) then
	        galinha.x = 225
	        galinha.y = 565
	    love.audio.play(somGalinha)
	    elseif collides(galinha, carro8) then
	        galinha.x = 225
	        galinha.y = 565
	    love.audio.play(somGalinha)
	    elseif collides(galinha, carro9) then
	        galinha.x = 225
	        galinha.y = 565
	    love.audio.play(somGalinha)
	    elseif collides(galinha, carro10) then
	        galinha.x = 225
	        galinha.y = 565
	    love.audio.play(somGalinha)
	    elseif collides(galinha, carroAzul1) then
	        galinha.x = 225
	        galinha.y = 565
	    love.audio.play(somGalinha)
	    elseif collides(galinha, carroAzul2) then
	        galinha.x = 225
	        galinha.y = 565
	    love.audio.play(somGalinha)
	    elseif collides(galinha, carroAzul3) then
	        galinha.x = 225
	        galinha.y = 565
	        love.audio.play(somGalinha)
	    end

	    if collides(galinha2, carro1) then
			love.audio.play(somGalinha)
	        galinha2.x = 675
	        galinha2.y = 565

	    elseif collides(galinha2, carro2) then
	        galinha2.x = 675
	        galinha2.y = 565
	    love.audio.play(somGalinha)
	    elseif collides(galinha2, carro3) then
	        galinha2.x = 675
	        galinha2.y = 565
	    love.audio.play(somGalinha)
	    elseif collides(galinha2, carro4) then
	        galinha2.x = 675
	        galinha2.y = 565
	    love.audio.play(somGalinha)
	    elseif collides(galinha2, carro5) then
	        galinha2.x = 675
	        galinha2.y = 565
	    love.audio.play(somGalinha)
	    elseif collides(galinha2, carro6) then
	        galinha2.x = 675
	        galinha2.y = 565
	    love.audio.play(somGalinha)
	    elseif collides(galinha2, carro7) then
	        galinha2.x = 675
	        galinha2.y = 565
	    love.audio.play(somGalinha)
	    elseif collides(galinha2, carro8) then
	        galinha2.x = 675
	        galinha2.y = 565
	    love.audio.play(somGalinha)
	    elseif collides(galinha2, carro9) then
	        galinha2.x = 675
	        galinha2.y = 565
	    love.audio.play(somGalinha)
	    elseif collides(galinha2, carro10) then
	        galinha2.x = 675
	        galinha2.y = 565
	    love.audio.play(somGalinha)
	    elseif collides(galinha2, carroAzul1) then
	        galinha2.x = 675
	        galinha2.y = 565
	    love.audio.play(somGalinha)
	    elseif collides(galinha2, carroAzul2) then
	        galinha2.x = 675
	        galinha2.y = 565
	    love.audio.play(somGalinha)
	    elseif collides(galinha2, carroAzul3) then
	        galinha2.x = 675
	        galinha2.y = 565
	        love.audio.play(somGalinha)
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
			
    		jogador={"Brayan",24}
    		love.graphics.print("O jogador "..jogador[1].." e o vencedor",320,350,0,2,2)
		--Exemplo de Tupla
    	
    	elseif(pontos<pontos2) then
    		love.graphics.setColor(255,255,255)
    		love.graphics.print("Jogador 2 e o vencedor",320,350,0,2,2)
    		
    	elseif(pontos==pontos2) then
    		love.graphics.setColor(255,255,255)
    		love.graphics.print("Empate!!",400,350,0,2,2)	
    		
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

	    love.graphics.setColor(0,0,0)
	    love.graphics.print("Pontuação: "..pontos,150,5,0,2,2)
	    love.graphics.setColor(0,0,0)
	    love.graphics.print("Pontuação: "..pontos2,580,5,0,2,2)
	    love.graphics.setColor(0,0,0)
	    love.graphics.print("Tempo: "..tempo,385,5,0,2,2)
	end   
end	
