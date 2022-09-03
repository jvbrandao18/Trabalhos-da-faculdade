import React, {Component} from 'react';


class App extends Component {
    constructor(props){

        super(props);
        this.state = {
            email: "",
            senha: "",
            mensagem: ""
        }

        this.enviar = this.enviar.bind(this)
    }

    enviar(event){
        let state = this.state;
        if(state.email === "abc" && state.senha === "123"){
            state.mensagem = "Acessado com sucesso.";
            this.setState(state);
        } 
        else{
            state.mensagem = "Usuário ou senha incorretos.";
            this.setState(state);
        }
        event.preventDefault();
    }
    render() { 
        return (
            <form onSubmit={this.enviar}>
                <h2>Email</h2> <br/>
                <input type="text" placeholder="Email" size="20" onChange={(e) =>this.setState({email: e.target.value})}/> <br/>
                <h2>Senha</h2> <br/>
                <input type="password" placeholder="Senha" size="20" onChange={(e) =>this.setState({senha: e.target.value})}/> <br/>
                <br/>
                <button type="submit" >Enviar</button> <br/>
                <h2>{this.state.mensagem}</h2>
            </form>
        )
    }
}

export default App;
