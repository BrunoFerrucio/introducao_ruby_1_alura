def dar_boas_vindas
   puts
   puts "        P  /_\  P                              "
   puts "       /_\_|_|_/_\                             "
   puts "   n_n | ||. .|| | n_n         Bem vindo ao    "
   puts "   |_|_|nnnn nnnn|_|_|     Jogo de Adivinhação!"
   puts "  |' '  |  |_|  |'  ' |                        "
   puts "  |_____| ' _ ' |_____|                        " 
   puts "        \__|_|__/                              "
   puts
   puts "Qual o seu nome ?"
   nome = gets.strip #Tira as partes em branco dos dois lados
   puts "\n \n \n"
   puts "Começaremos o jogo para você, #{nome}"
   nome
end

def pede_dificuldade
  puts "Qual o nível de dificuldade?"
  puts "(1) Muito fácil (2) Fácil (3) Normal (4) Difícil (5) Impossível"
  puts "Escolha: "
  dificuldade = gets.to_i
end

def sorteia_numero_secreto(dificuldade)
   case dificuldade
   when 1
      maximo = 30
   when 2
      maximo = 60
   when 3
      maximo = 100
   when 4
      maximo = 150
   else
      maximo = 200
   end
   
   puts "Escolhendo número secreto entre 1 e #{maximo}..."
   sorteado = rand(maximo) +1 #sorteia um número entre 0 e 200
   puts "Escolhido... que tal adivinhar hoje nosso número secreto?"
   sorteado #retorna o numero sorteado
end

def pede_um_numero(chutes, tentativa, limite_de_tentativas)
   puts "\n\n\n\n"
   puts "Tentativa #{tentativa} de #{limite_de_tentativas}"
   puts "Chutes até agora: #{chutes}"
   puts "Entre com o número"
   chute = gets.strip
   puts "Será que acertou? Você chutou #{chute}"
   # ${} interpola varior em uma String
   chute.to_i
end

def ganhou
   puts
   puts "             OOOOOOOOOOO               "
   puts "         OOOOOOOOOOOOOOOOOOO           "
   puts "      OOOOOO  OOOOOOOOO  OOOOOO        "
   puts "    OOOOOO      OOOOO      OOOOOO      "
   puts "  OOOOOOOO  #   OOOOO  #   OOOOOOOO    "
   puts " OOOOOOOOOO    OOOOOOO    OOOOOOOOOO   "
   puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
   puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
   puts "OOOO  OOOOOOOOOOOOOOOOOOOOOOOOO  OOOO  "
   puts " OOOO  OOOOOOOOOOOOOOOOOOOOOOO  OOOO   "
   puts "  OOOO   OOOOOOOOOOOOOOOOOOOO  OOOO    "
   puts "    OOOOO   OOOOOOOOOOOOOOO   OOOO     "
   puts "      OOOOOO   OOOOOOOOO   OOOOOO      "
   puts "         OOOOOO         OOOOOO         "
   puts "             OOOOOOOOOOOO              "
   puts
   puts "               Acertou!                "
   puts
end

def verifica_se_acertou(numero_secreto, chute)
   #compara se o numero secreto é igual ao chute
   #numero secreto não sendo true (igual) retorna false
   acertou = numero_secreto == chute
   
   #acertou ou não ?
   if acertou #roda se true
      ganhou
      return true
   end
   
   maior = numero_secreto > chute
   if maior
      puts "O número secreto é maior!"
   else
      puts "O número secreto é menor!"
   end
   false
   #No Ruby não é comum usar a palavra return
   #Só deixar o que precisa retornar na ultima linha
end

def joga(nome, dificuldade)
   numero_secreto = sorteia_numero_secreto dificuldade

   limite_de_tentativas = 5
   chutes = []
   pontos_ate_agora = 1000

   for tentativa in 1..limite_de_tentativas
      chute = pede_um_numero chutes, tentativa, limite_de_tentativas
      chutes << chute #Coloca o chute na ultima posição
      # chutes.size mostra o tamanho do array

      if nome == "Bruno"
         ganhou
         break
      end

         pontos_a_perder = (chute - numero_secreto).abs / 2.0
      pontos_ate_agora = pontos_ate_agora - pontos_a_perder
      if verifica_se_acertou numero_secreto, chute
         break
      end
   end

   puts "Você ganhou #{pontos_ate_agora} pontos."
end

def nao_quer_jogar?
   puts "Deseja jogar novamente? (S/N)"
   quero_jogar = gets.strip
   nao_quero_jogar = quero_jogar.upcase == "N"
end

nome = da_boas_vindas
dificuldade = pede_dificuldade

loop do #Executa infinitamente
   joga nome, dificuldade
   break if nao_quer_jogar?
end

#to_s = converte para String
#to_i = converte para inteiro
# .abs (absolute) devolve o número absoluto sem nenhum sinal

# para saber os metodos que uma variavel suporrta, vá para o terminal e use irb e depois coloca a variavel preenchida e use ".methods"