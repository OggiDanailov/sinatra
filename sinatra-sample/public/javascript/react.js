 class App extends React.Component{
	constructor(props){
		super(props)
		this.state =  {
			businesses: []
		}
		var app = this;

	axios.get("https://yelp-search.herokuapp.com/search", {
	params: {
		location: 'Philadelphia',
		term: 'beer'
	}

	}).then(function(response){
	app.setState({businesses: 
		response.data.businesses})	
	})
}

	render(){
		return(
			<div>
				<YelpResults results={this.state.businesses} />
			</div>
		)
	}
}


function YelpResults(props){
	let businesses = props.results.map(function(result)
	{
		return(
			<div className='api-results'>
				<div className='img-text'>{result.name}</div>
				<img className='images-api' src={result.image_url} />

			</div>
			) 
	})

	return(
		 <div>{businesses}</div>
		 )
}



ReactDOM.render(
	<App />,
	document.getElementById('react')
	)



