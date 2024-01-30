if [[ -z $1 ]];
	then 
    	echo "Por favor, ingresa el nombre/id de un pokemon.";
		exit 0;
	fi

fetchPokemonInfoById() {
	# Converts the pokemon name to lowercase
  	pokemonId=$(echo $1 | tr "[:upper:]" "[:lower:]");

	informationURL="https://pokeapi.co/api/v2/pokemon/$pokemonId";

	response=$(curl $informationURL);
		
	echo $response;
}

printPokemonInfo() {
	pokemonInfoJSON=$1;

	echo "
		$(echo $pokemonInfoJSON | jq '.name') (No. $(echo $pokemonInfoJSON | jq '.id'))
		Id: $(echo $pokemonInfoJSON | jq '.id')
		Weight: $(echo $pokemonInfoJSON | jq '.weight')
		Height: $(echo $pokemonInfoJSON | jq '.height')
	";
}

printPokemonInfo $(fetchPokemonInfoById $1);