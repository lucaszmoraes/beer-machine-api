RESTful API construída em Rails 6 e Ruby 2.5.3.

- Inicie em http://localhost:2000

- Nenhuma autenticação é necessária

- Endpoints:
	- GET em localhost:2000/api/v1/beers
		- lista todas as Cervejas cadastradas
	
	- GET em localhost:3000/api/v1/beers/:id
		- retorna informações sobre a cerveja de ID => id
	
	- POST em localhost:3000/api/v1/beers
		- cria uma cerveja nova com a hash Beer
			- campos obrigatórios: 
				- beer[style] (string)
				- beer[min_temperature] (integer)
				- beer[max_temperature] (integer)
				
	- POST em localhost:3000/api/v1/beers/:id
		- atualiza uma cerveja
			- campos obrigatórios: 
				- beer[style] (string)
				- beer[min_temperature] (integer)
				- beer[max_temperature] (integer)
	
	- POST em localhost:2000/api/v1/beers/menu/melhor-cerveja
		- retorna um JSON com o style da cerveja mais adequada para uma dada temperatura que mais se aproxima das temperaturas máximas e mínimas de consumo de todas as cervejas cadastradas
			- campos obrigatórios: 
				- beer[temperature] (integer)
				
	- DELETE em localhost:3000/api/v1/beers/:id
		- destroy a cerveja de ID => id
			- campos obrigatórios
				- id (string)
