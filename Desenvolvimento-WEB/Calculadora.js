import React from 'react';
import './App.css';


const Painel = () => {
  return(
    <div className="painel">
      0.75
    </div>
  )
}

const Botao = (props) => {
  return (
    <div className={props.tipo}>
      {props.digito}
    </div>
  )
}

function App() {
  return (
    <div className="painel-botoes">
      <Painel/>
      <Botao tipo="botaoAC" digito="AC"/>
      <Botao tipo="botaoDiv" digito="/"/>
      <Botao tipo="botaoNum" digito="7"/>
      <Botao tipo="botaoNum" digito="8"/>
      <Botao tipo="botaoNum" digito="9"/>
      <Botao tipo="botaoDiv" digito="*"/>
      <Botao tipo="botaoNum" digito="4"/>
      <Botao tipo="botaoNum" digito="5"/>
      <Botao tipo="botaoNum" digito="6"/>
      <Botao tipo="botaoDiv" digito="-"/>
      <Botao tipo="botaoNum" digito="1"/>
      <Botao tipo="botaoNum" digito="2"/>
      <Botao tipo="botaoNum" digito="3"/>
      <Botao tipo="botaoDiv" digito="+"/>
      <Botao tipo="botaoZero" digito="0"/>
      <Botao tipo="botaoVirg" digito=","/>
      <Botao tipo="botaoDiv" digito="="/>
    </div>
  );
}
  
export default App;
