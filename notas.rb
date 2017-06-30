



class Menu
	attr_reader	:exit

	def initialize
		@exit = false
	end


	def mostrar_menu 
		puts '----->La Escuelita<-----'
		puts '1) Nombre y Promedio Alumno'
		puts '2) Inasistencias Totales'
		puts '3) Alumnos Aprobados'
		puts '4) Salir'
		puts 'Opción:'
		
	end

	def opciones
		opt = gets.chomp.to_i.abs

		case opt
			when 1 then
				promedio_alumno
			when 2 then
				inasistencias_totales
			when 3 then
				alumnos_aprobados	
			when 4 then
				@exit = true	
		end
	end

	
	def promedio_alumno
		puts '----->La Escuelita<-----'
		file = File.open('prueba.csv', 'r')
		alumnos = file.readlines
		file.close
		suma = 0
		alumnos.each do |notas|
			suma += notas.split(', ')[1].to_f 
			nombre = notas.split(', ')[0] 
			suma = 0
			notas.split(', ').each_with_index do |elemento, indice|
				if indice != 0
					suma += elemento.split("\n")[0].to_i
				end
			end
			promedio = suma.to_f / (notas.split(', ').length - 1) 
			puts "#{nombre} #{promedio}"
		end
	end


	def inasistencias_totales 
		puts '----->La Escuelita<-----'
		file = File.open('prueba.csv', 'r')
		alumnos = file.readlines
		file.close
		asist = 0
		alumnos.each_with_index do |elemento, indice|
			 if elemento.include?("A")
			 	asist = asist+1
			end	
			puts asist
		end
	end

	def alumnos_aprobados
		puts '----->La Escuelita<-----'
		file = File.open('prueba.csv', 'r')
		alumnos = file.readlines
		file.close
		suma = 0
		alumnos.each do |notas|
			suma += notas.split(', ')[1].to_f 
			nombre = notas.split(', ')[0] 
			suma = 0
			notas.split(', ').each_with_index do |elemento, indice|
				if indice != 0
					suma += elemento.split("\n")[0].to_i
				end
			end
			promedio = suma.to_f / (notas.split(', ').length - 1) 
			if promedio >= 5
				puts "#{nombre} #{promedio}"
			end
		end
	end





menu = Menu.new

until menu.exit
	menu.mostrar_menu
	menu.opciones
end
end

